//
//  MapViewViewModel.swift
//  PoolMe
//
//  Created by Chanchal Raj on 27/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

import Foundation
import RxSwift
class MapViewViewModel {
    ///Collection of POIs
    var POIs = Variable<[Poi]>([])
    ///Dispose Bag for disposing off Rx Objects
    let disposeBag = DisposeBag()
    
    /**
     Fetches all POIs from API with given rectangle area.
     
     - Parameters:
        - point1: Point in top-right corner
        - point2: Point in bottom-left corner
     */
    func fetchPOIs(point1:CLLocationCoordinate2D,point2:CLLocationCoordinate2D) {
        let signal = APIClient.fetchPOIsBetweenPoint1(point1, andPoint2: point2)
        signal.subscribeNext { (array) in
            if let pois = array as? Array<Poi>{
                print("# of counts: \(pois.count)")
                self.POIs.value = pois
            }
        }
    }
}
