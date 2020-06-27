//
//  TitleAdventureTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class TitleAdventureTests: XCTestCase {
    
    var titleAdventureView: TitleAdventure!
    //var titleAdventureViewCoder: TitleAdventure!
    
    override func setUp() {
        titleAdventureView = TitleAdventure()
        //titleAdventureViewCoder = TitleAdventure(coder: NSCoder())
    }
    
    override func tearDown() {
        titleAdventureView = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(titleAdventureView.subviews.isEmpty)
    }
    
//    func testInitializingCoder() {
//        XCTAssertFalse((titleAdventureViewCoder != nil))
//    }
    
    func testRoundCorner() {
        titleAdventureView.layoutSubviews()
        XCTAssertNotNil(titleAdventureView.layer.mask)
    }
}
