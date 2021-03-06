//
//  MapViewController.swift
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//
//PS. The POIs API is fetching some dumy vehicles data on each API call, causing Vehicles to behave abnormly. If the data could have been real, it would have been more fun to see.
//I really like the divide and conqure algorithm for map views to reduce API costs especially for large amounts of data. It is well-explained here well:
//https://robots.thoughtbot.com/how-to-handle-large-amounts-of-data-on-maps

import UIKit
import MapKit
class MapViewController:UIViewController{
    
    @IBOutlet weak var mapView: MKMapView!
    ///viewModel for MapViewConroller class
    let viewModel = MapViewViewModel()
    
    private var locationManager: CLLocationManager!
    
    //MARK:- View Life Cycle
    override func viewDidLoad() {
        self.bindView()
        self.getCurrentLocation()
        mapView.showsUserLocation = true
    }
    //MARK:- Utility Methods
    /**
     Binds data source in viewModel to addCarsToMap(POIs) function
     */
    private func bindView(){
        viewModel.POIs.asObservable().subscribe(onNext:{POIs in
            self.addCarsToMap(POIs: POIs)
            
        }).disposed(by: viewModel.disposeBag)
    }
    /**
     Initializes CLLocationManager instance and starts updating location
     */
    private func getCurrentLocation(){
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()
            locationManager.startUpdatingLocation()
        }else{
            //Show prompt to user to turn on location service
            let alert = UIAlertController.init(title: "Turn on location services", message: "To show to nearest vehicles around, we need your location. Kindly turn the location services on in settings.", preferredStyle: .alert)
            let actionSetting = UIAlertAction.init(title: "Open Settings", style: UIAlertActionStyle.cancel, handler: { (_) in
                if let url = URL(string: UIApplicationOpenSettingsURLString) {
                    UIApplication.shared.open(url, completionHandler: .none)
                }
            })
            let cancel = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.default, handler: nil)
            alert.addAction(cancel)
            alert.addAction(actionSetting)
            self.show(alert, sender: self)
        }
    }
    /**
     Adds vehicles to map after removing all previously added vehicles.
     
     - Parameters:
        - POIs: Array of Poi objects
     */
    private func addCarsToMap(POIs:[Poi]){
        mapView.removeAnnotations(mapView.annotations)
        for poi in POIs{
            mapView.addAnnotation(poi)
        }
    }
    /**
     Fetches all the POIs within the visible Map area
     
     Visible map area is the area between top-right and bottom-left points
     */
    fileprivate func fetchPOIs(){
        //Map points
        let mRect = self.mapView.visibleMapRect;
        let neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
        let swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
        let neCoord = MKCoordinateForMapPoint(neMapPoint);
        let swCoord = MKCoordinateForMapPoint(swMapPoint);
        viewModel.fetchPOIs(point1: neCoord, point2: swCoord)
    }
    @IBAction func btnCurrentLocation(_ sender: Any) {
        let region = MKCoordinateRegion.init(center: mapView.userLocation.coordinate, span: MKCoordinateSpan.init(latitudeDelta: 0.2, longitudeDelta: 0.2))
        mapView.region = region
    }
}

//MARK:- MKMapViewDelegate Methods
extension MapViewController:MKMapViewDelegate{
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let annotationIdentifier = "Identifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = true
            if let poi = annotation as? Poi{
                if poi.fleetType == FleetType.taxi{
                    if let car = UIImage(named: "car"){
                        annotationView.image = car.image(withRotation: CGFloat(poi.heading))
                    }
                    
                }else{
                    if let pool = UIImage(named: "pool"){
                        annotationView.image = pool.image(withRotation: CGFloat(poi.heading))
                    }
                }
                
            }
            
        }
        return annotationView
    }
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        fetchPOIs()
    }
}
//MARK:- CLLocationManagerDelegate Methods
extension MapViewController:CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last{
            if (location.horizontalAccuracy < 0){return}
            let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            self.mapView.setRegion(region, animated: false)
            manager.stopUpdatingLocation()
            
        }
    }
}

//MARK:-
extension Poi:MKAnnotation{
    public var title: String? {
        return self.fleetType == FleetType.taxi ? "Taxi" : "Pooling"
    }
}
