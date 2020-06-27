//
//  EmptyStateComponentTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class EmptyStateComponentTests: XCTestCase {

    var stateComponent: EmptyState!
    
    override func setUp() {
        stateComponent = EmptyState()
    }
    
    override func tearDown() {
        stateComponent = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(stateComponent.subviews.isEmpty)
    }
}
