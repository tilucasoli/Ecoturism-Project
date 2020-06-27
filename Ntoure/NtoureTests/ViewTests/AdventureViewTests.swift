//
//  AdventureViewTests.swift
//  NtoureTests
//
//  Created by Anderson Alencar on 27/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import XCTest
@testable import Ntoure

class AdventureViewTests: XCTestCase {

    var adventureview: AdventureView!
    let id = UUID()
    let acessory = PlaceAcessory(id: UUID())
    
    override func setUp() {
        adventureview = AdventureView()
    }
    
    override func tearDown() {
        adventureview = nil
    }
    
    func testInitializing() {
        XCTAssertFalse(adventureview.subviews.isEmpty)
    }
    
    func testTapButton() {
        let selectedLocation = SelectedLocationViewController()
        adventureview.delegate = selectedLocation
        let allAdventuresButton = adventureview.showAllAdventures
        //verifica a existencia do botao
        XCTAssertNotNil(allAdventuresButton)
        //verifica se existem acoes
        guard let allAdventuresActions = allAdventuresButton.actions(forTarget: adventureview, forControlEvent: .touchUpInside) else {
            XCTFail("View nao tem acoes assinadas no botao para .touchUpInside")
            return
        }
        //verifica se é a ação que eu quero
        XCTAssertTrue(allAdventuresActions.contains("pushAllAdventures"))
        
        adventureview.pushAllAdventures()
        XCTAssertNotNil(adventureview.delegate)
    }
    
    func testTableView() { // tentar depois
        adventureview.guideList = [Adventure(id: id, photoActivity: UIImage(named: "canoaQuebrada1")!.jpegData(compressionQuality: 0.9)!,
                                             activityName: "Canoagem", location: ["location"], category: 0, description: "Muito Radical",
                                             status: false, care: ["Não jogar lixo"], phoneNumber: "989656232", address: "Rua maria, 187", place: acessory)]
        XCTAssertEqual(1, adventureview.adventureServices.numberOfRows(inSection: 0))

    }
}
