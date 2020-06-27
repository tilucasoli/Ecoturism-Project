//
//  MyCustomHeaderViewTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure


class MyCustomHeaderViewTests: XCTestCase {

    var customHeader: MyCustomHeader!

    override func setUp() {
        customHeader = MyCustomHeader(reuseIdentifier: "ReuseIdentifierTests")
    }
    
    override func tearDown() {
        customHeader = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(customHeader.subviews.isEmpty)
    }
}
