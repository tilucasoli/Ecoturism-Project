//
//  LocationCoordinateTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
import MapKit
@testable import Ntoure

class LocationCoordinateTests: XCTestCase {

    var location: LocationCoordinate!
    
    override func setUp() {
        location = LocationCoordinate(title: "Cumbuco", locationName: "Bairro no Ceará", coordinate: CLLocationCoordinate2D(latitude: -3.6467904, longitude: -38.69615054))
    }
    
    override func tearDown() {
        location = nil
    }
    
    func testMapItem() {
        XCTAssertNotNil(location.mapItem)
    }
    
    func testLocationAttributes() {
        let myCoordinates = CLLocationCoordinate2D(latitude: -3.6467904, longitude: -38.69615054)
        XCTAssertEqual("Cumbuco", location.title)
        XCTAssertEqual("Bairro no Ceará", location.locationName)
        XCTAssertEqual(myCoordinates.latitude, location.coordinate.latitude)
        XCTAssertEqual(myCoordinates.longitude, location.coordinate.longitude)
    }
}
