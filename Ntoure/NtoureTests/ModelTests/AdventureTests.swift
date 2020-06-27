//
//  AdventureTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class AdventureTests: XCTestCase {

    var adventure: Adventure!
    let id = UUID()
    let acessory = PlaceAcessory(id: UUID())
    
    override func setUp() {
        adventure = Adventure(id: id, photoActivity: UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!, activityName: "Canoagem", location: ["location"], category: 0, description: "Muito Radical", status: false, care: ["Não jogar lixo"], phoneNumber: "989656232", address: "Rua maria, 187", place: acessory)
    }
    
    override func tearDown() {
        adventure = nil
    }
    
    func testID() {
        XCTAssertEqual(id, adventure.id)
    }

    func testDataPhoto() {
        XCTAssertEqual(adventure.photoActivity, UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!)
    }
    
    func testActivity() {
        XCTAssertEqual(adventure.activityName, "Canoagem")
    }
    
    func testDescription() {
         XCTAssertEqual(adventure.description, "Muito Radical")
    }
    
}
