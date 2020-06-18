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
}

extension ViewCode {
    func setUp() {
        buildHierarchy()
        setUpLayoutConstraints()
        aditionalConfigurations()
    }
}

struct CustomData {
    var title: String
    var distance: String
    var image: UIImage
    var state: String?
}
