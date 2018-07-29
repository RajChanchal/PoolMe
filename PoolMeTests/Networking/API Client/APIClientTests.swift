//
//  APIClientTests.swift
//  PoolMeTests
//
//  Created by Chanchal Raj on 29/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

import XCTest
import MapKit

@testable import PoolMe
class APIClientTests: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFullURL(){
        //Arrange:
        let originalURL = "https://fake-poi-api.mytaxi.com/?p2Lat=53.394655&p1Lon=9.757589&p1Lat=53.694865&p2Lon=10.099891"
        let point1 = CLLocationCoordinate2D.init(latitude:53.694865 , longitude: 9.757589)
        let point2 = CLLocationCoordinate2D.init(latitude:53.394655 , longitude: 10.099891)
        let baseURL = "https://fake-poi-api.mytaxi.com"
        
        //Act:
        let fullURL = APIClient.url(withBaseURL: baseURL, point1: point1, point2: point2)
        
        //Assert:
        XCTAssertEqual(fullURL, originalURL,"URLs aren't same")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
