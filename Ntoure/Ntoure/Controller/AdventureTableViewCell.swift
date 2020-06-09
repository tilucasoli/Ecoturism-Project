//
//  AdventureTableViewCell.swift
//  Ntoure
//
//  Created by Larissa Uchoa on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class AdventureTableViewCell: UITableViewCell {
    
    var adventureImageView = UIImageView()
    var adventureTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(adventureImageView)
        addSubview(adventureTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        setImageConstraints()
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(adventure: Adventure) {
        adventureImageView.image = adventure.image
        adventureTitleLabel.text = adventure.title
    }
    
    func configureImageView() {
        adventureImageView.layer.cornerRadius = 8
        adventureImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        adventureTitleLabel.numberOfLines = 0
        adventureTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    func setImageConstraints() {
        adventureImageView.translatesAutoresizingMaskIntoConstraints = false
        
        adventureImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        adventureImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6).isActive = true
        adventureImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        adventureImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setTitleLabelConstraints() {
        adventureTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        adventureTitleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        adventureTitleLabel.leadingAnchor.constraint(equalTo: adventureImageView.trailingAnchor, constant: 16).isActive = true
        adventureTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        adventureTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -6).isActive = true
    }
}
