//
//  GuideTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class GuideTests: XCTestCase {

    var guide: Guide!
    let id = UUID()
    
    override func setUp() {
        guide = Guide(name: "FortalezaTravels")
    }
    
    override func tearDown() {
        guide = nil
    }
    
    func testAddServiceInTodo() {
        let acessory = PlaceAcessory(id: id)
        let idealAdventuresCount = 1
        let adventure = Adventure(id: id, photoActivity: UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!, activityName: "Canoagem", location: ["location"], category: 0, description: "Muito radical", status: false, care: ["Não jogar lixo"], phoneNumber: "989656232", address: "Rua maria, 187", place: acessory)
        guide.addServiceInTodo(service: adventure)
        XCTAssertEqual(idealAdventuresCount, guide.adventures.count)
    }
}
