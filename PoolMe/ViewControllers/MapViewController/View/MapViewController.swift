//
//  MapViewController.swift
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

import UIKit
import MapKit
class MapViewController:UIViewController{
    
    @IBOutlet weak var mapView: MKMapView!
    let viewModel = MapViewViewModel()
    override func viewDidLoad() {
        mapView.delegate = self
    
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        //Map points
        let mRect = self.mapView.visibleMapRect;
        let neMapPoint = MKMapPointMake(MKMapRectGetMaxX(mRect), mRect.origin.y);
        let swMapPoint = MKMapPointMake(mRect.origin.x, MKMapRectGetMaxY(mRect));
        let neCoord = MKCoordinateForMapPoint(neMapPoint);
        let swCoord = MKCoordinateForMapPoint(swMapPoint);
        viewModel.fetchPOIs(point1: neCoord, point2: swCoord)
    }
}
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
            annotationView.image = UIImage(named: "car")
        }
        return annotationView
    }
}
