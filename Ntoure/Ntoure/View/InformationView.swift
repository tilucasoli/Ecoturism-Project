//
//  InformationView.swift
//  Ntoure
//
//  Created by Anderson Alencar on 11/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class InformationView: UIView {

    lazy var title: UILabel = {
        var title = UILabel()
        title.text = "Informações"
        title.textColor = .titleColor
        title.numberOfLines = 1
        title.adjustsFontSizeToFitWidth = true
        title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var placeDescription: UILabel = {
        var description = UILabel()
        description.textColor = .textColor
        description.numberOfLines = 0
        description.textAlignment = .left
        description.adjustsFontSizeToFitWidth = true
        description.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
    }()
    
    init(frame: CGRect, placeDescription: String) {
        super.init(frame: frame)
        self.placeDescription.text = placeDescription
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InformationView: ViewCode {
    func buildHierarchy() {
        addSubview(title)
        addSubview(placeDescription)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            placeDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            placeDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            placeDescription.bottomAnchor.constraint(equalTo: bottomAnchor),
            placeDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            placeDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor)
//            placeDescription.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
    }

    func aditionalConfigurations() {
        backgroundColor = .background
    }
}
