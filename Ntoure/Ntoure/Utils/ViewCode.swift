//
//  ViewCode.swift
//  Ntoure
//
//  Created by Anderson Alencar on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import Foundation
import UIKit

protocol ViewCode {
    func buildHierarchy()
    func setUpLayoutConstraints()
    func aditionalConfigurations()
}

protocol MyDelegate: class {
    func onButtonTapped()
    func adventureTapped(data: Adventure)
}

protocol Delegate: class {
    func showModal()
}

extension ViewCode {
    func setUp() {
        buildHierarchy()
        setUpLayoutConstraints()
        aditionalConfigurations()
    }
}

struct CustomData: Codable {
    var name: String
    var distance: String
    var photo: Data
    var placeID: UUID
}
