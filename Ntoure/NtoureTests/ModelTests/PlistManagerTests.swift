//
//  PlistManagerTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure 

class PlistManagerTests: XCTestCase {
    
    var pList: PlistManager!
    
    override func setUp() {
        pList = PlistManager()
    }
    
    override func tearDown() {
        pList = nil
    }
    
    func testURL() {
        let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let URL = documents.appendingPathComponent("GuideData.plist")
        XCTAssertEqual(URL, pList.plistURL)
    }
    
    func testWrite() {
        let guides = [Guide]()
        XCTAssertTrue(pList.write(guide: guides))
    }
    
    func testRead() {
        let decoder = PropertyListDecoder()
        let infoPlistData = try? Data(contentsOf: pList.plistURL)
        if let arr = try? decoder.decode([Guide].self, from: infoPlistData!) {
            XCTAssertEqual(arr.count, pList.read().count)
        }
    }
    
}
