//
//  NtoureTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure 

class NtoureTests: XCTestCase {
    
    var place: Place!
    let id = UUID()

    override func setUp() {
        place = Place(id: id, namePlace: "Jericocoara", description: "Linda Praia", coverPhoto: UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!, presentationPhotos: [UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!], location: ["praia da barra"], distance: "50 km")
    }

    override func tearDown() {
        place = nil
    }

    func testPlaceDataAttributes() {
        let data = UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!
        
        XCTAssertEqual(data, place.coverPhoto)
        XCTAssertEqual([data], place.presentationPhotos)
    }
    
    func testPlaceID() {
        XCTAssertEqual(id, place.id)
    }
    
    func testPlaceStringAttributes() {
        XCTAssertEqual(place.description, "Linda Praia")
        XCTAssertEqual(place.distance, "50 km")
        XCTAssertEqual(place.location, ["praia da barra"])
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
