//
//  GuideCellTableViewCellTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class GuideCellTableViewCellTests: XCTestCase {

    var guideCell: GuideCellTableViewCell!
    
    override func setUp() {
        guideCell = GuideCellTableViewCell()
    }
    
    override func tearDown() {
        guideCell = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(guideCell.subviews.isEmpty)
    }
}
