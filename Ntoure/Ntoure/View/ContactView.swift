//
//  ContactView.swift
//  Ntoure
//
//  Created by Vitor Bryan on 23/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class ContactView: UIView {

    lazy var title: UILabel = {
       var title = UILabel()
       title.textColor = .titleColor
       title.numberOfLines = 1
       title.adjustsFontSizeToFitWidth = true
       title.font = UIFont.systemFont(ofSize: 20, weight: .medium)
       title.translatesAutoresizingMaskIntoConstraints = false
       return title
   }()
   
   lazy var placeDescription: UIButton = {
        var description = UIButton()
        description.setTitleColor(.actionColor, for: .normal)
        description.titleLabel!.adjustsFontSizeToFitWidth = true
        description.titleLabel?.lineBreakMode = NSLineBreakMode.byWordWrapping
        description.titleLabel?.numberOfLines = 0
        description.titleLabel?.textAlignment = .left
        description.titleLabel!.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        description.translatesAutoresizingMaskIntoConstraints = false
        return description
   }()
   
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.title.text = title
        setUp()
   }
   
   required init?(coder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
   }
}

extension ContactView: ViewCode {
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
            placeDescription.titleLabel!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            placeDescription.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            placeDescription.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            placeDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            placeDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor)
       ])
   }

   func aditionalConfigurations() {
       backgroundColor = .background
   }
}
