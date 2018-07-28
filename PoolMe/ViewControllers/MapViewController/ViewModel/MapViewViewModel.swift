//
//  MapViewViewModel.swift
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

import Foundation
class MapViewViewModel {
    var POIs:[Poi]?
    func fetchPOIs(point1:CLLocationCoordinate2D,point2:CLLocationCoordinate2D) {
        let signal = APIClient.fetchPOIsBetweenPoint1(point1, andPoint2: point2)
        signal.subscribeNext { (array) in
            if let pois = array as? Array<Poi>{
                print("# of counts: \(pois.count)")
                self.POIs = pois
            }
        }
    }
}
