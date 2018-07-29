//
//  PoiModelTests.swift
//  PoolMeTests
//
//  Created by Chanchal Raj on 29/07/2018.
//  Copyright © 2018 Chanchal Raj. All rights reserved.
//

import XCTest

class PoiModelTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPOIInit_FleetTypePooling() {
    
        //Arrange:
        let id = 280787
        let latitude = 53.59842315604904
        let longitude = 10.062897703509671
        let fleetType = "POOLING"
        let heading = 113.69866050728216
        let modelDictionary = ["id":id,
                               "coordinate":["latitude":latitude,"longitude":longitude],
                               "fleetType": fleetType,
                               "heading": heading
            ] as [String : Any]
        //ACT:
        let poi = Poi.init(dictionary: modelDictionary)
        
        //Assert:
        XCTAssertEqual(poi.poiID, id)
        XCTAssertEqual(poi.coordinate.latitude, latitude)
        XCTAssertEqual(poi.coordinate.longitude, longitude)
        XCTAssertEqual(poi.fleetType, FleetType.pooling)
        XCTAssertEqual(poi.heading, heading)
    }
    func testPOIInit_FleetTypeTaxi() {
    
        //Arrange:
        let id = 280787
        let latitude = 53.59842315604904
        let longitude = 10.062897703509671
        let fleetType = "TAXI"
        let heading = 113.69866050728216
        let modelDictionary = ["id":id,
                               "coordinate":["latitude":latitude,"longitude":longitude],
                               "fleetType": fleetType,
                               "heading": heading
            ] as [String : Any]
        //ACT:
        let poi = Poi.init(dictionary: modelDictionary)
        
        //Assert:
        XCTAssertEqual(poi.poiID, id)
        XCTAssertEqual(poi.coordinate.latitude, latitude)
        XCTAssertEqual(poi.coordinate.longitude, longitude)
        XCTAssertEqual(poi.fleetType, FleetType.taxi)
        XCTAssertEqual(poi.heading, heading)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
