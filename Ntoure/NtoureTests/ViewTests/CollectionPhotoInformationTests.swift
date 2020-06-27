//
//  CollectionPhotoInformationTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class CollectionPhotoInformationTests: XCTestCase {

    var collectionInformation: CollectionPhotoInformation!
    
    override func setUp() {
        collectionInformation = CollectionPhotoInformation()
    }
    
    override func tearDown() {
        collectionInformation = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(collectionInformation.subviews.isEmpty)
    }
    
    func testImages() {
        let numberOfImages = 2
        collectionInformation.images = [UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!,UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!]
        XCTAssertEqual(numberOfImages, collectionInformation.images.count)
    }
}
