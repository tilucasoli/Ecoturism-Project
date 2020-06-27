//
//  PhotoCollectionViewCellTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class PhotoCollectionViewCellTests: XCTestCase {

    var photoCollection: PhotoCollectionViewCell!
    
    override func setUp() {
        photoCollection = PhotoCollectionViewCell()
    }
    
    override func tearDown() {
        photoCollection = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(photoCollection.subviews.isEmpty)
    }
    
}
