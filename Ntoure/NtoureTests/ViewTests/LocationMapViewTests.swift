//
//  LocationMapViewTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class LocationMapViewTests: XCTestCase {

    var locationMap: LocationMapView!
    
    override func setUp() {
        locationMap = LocationMapView()
    }
    
    override func tearDown() {
        locationMap = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(locationMap.subviews.isEmpty)
    }
}
