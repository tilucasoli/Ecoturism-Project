//
//  Fonts.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 10/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

extension UIFont {
    static let largeTitleGraviola: UIFont = {
        let font = UIFont(name: "Graviola-Regular", size: 34)!
        return font
    }()
}

let stylingFont = [
    NSAttributedString.Key.strokeColor: UIColor.titleColor,
    NSAttributedString.Key.foregroundColor: UIColor.titleColor,
    NSAttributedString.Key.strokeWidth: -2.5,
    NSAttributedString.Key.font: UIFont.largeTitleGraviola]
    as [NSAttributedString.Key: Any]
