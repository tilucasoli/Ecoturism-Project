//
//  AdventureTableViewCellTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class AdventureTableViewCellTests: XCTestCase {

    var adventureAcell: AdventureTableViewCell!
    
    override func setUp() {
        adventureAcell = AdventureTableViewCell()
    }
    
    override func tearDown() {
        adventureAcell = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(adventureAcell.subviews.isEmpty)
    }
}
