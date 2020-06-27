//
//  ContactViewTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class ContactViewTests: XCTestCase {

    var contactView: ContactView!
    
    override func setUp() {
        contactView = ContactView(frame: .zero, title: "TitleTests")
    }
    
    override func tearDown() {
        contactView = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(contactView.subviews.isEmpty)
    }
}
