//
//  InformationViewTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class InformationViewTests: XCTestCase {

    var information: InformationView!
    
    override func setUp() {
        information = InformationView()
    }
    
    override func tearDown() {
        information = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(information.subviews.isEmpty)
    }
}
