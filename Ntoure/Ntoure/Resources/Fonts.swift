//
//  Fonts.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 10/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

extension UIFont {
    static let largeTitleGraviola = UIFont(name: "Graviola-Regular", size: 34)!
    static let illustrationTitle = UIFont(name: "Graviola-Regular", size: 23)!
    static let placeTitle = UIFont(name: "Graviola-Regular", size: 22)!
}

let largeTitleStyle = [
    NSAttributedString.Key.strokeColor: UIColor.titleColor,
    NSAttributedString.Key.foregroundColor: UIColor.titleColor,
    NSAttributedString.Key.strokeWidth: -2.5,
    NSAttributedString.Key.font: UIFont.largeTitleGraviola]
    as [NSAttributedString.Key: Any]

let illustrationTitle = [
    NSAttributedString.Key.strokeColor: UIColor.titleColor,
    NSAttributedString.Key.foregroundColor: UIColor.titleColor,
    NSAttributedString.Key.strokeWidth: -2.5,
    NSAttributedString.Key.font: UIFont.illustrationTitle]
    as [NSAttributedString.Key: Any]

let placeTitle = [
    NSAttributedString.Key.strokeColor: UIColor.titleColor,
    NSAttributedString.Key.foregroundColor: UIColor.titleColor,
    NSAttributedString.Key.strokeWidth: -2.5,
    NSAttributedString.Key.font: UIFont.placeTitle]
    as [NSAttributedString.Key: Any]
