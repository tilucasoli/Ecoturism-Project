//
//  CustomCellViewController.swift
//  Ntoure
//
//  Created by Vitor Bryan on 15/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class CustomCellViewController: UICollectionViewCell {
    var data: CustomData? {
        didSet {
            guard let data = data else {return}
            bg.image = data.image
            title.text = data.title
            describ.text = data.distance
        }
    }
    
    fileprivate let bg: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
        
    }()

    fileprivate let gradient: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Rectangle 90")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    fileprivate let title: UILabel = {
        let text = UILabel()
        
        text.textColor = UIColor.white
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 25)
        return text
    }()
    
    fileprivate let describ: UILabel = {
        let text = UILabel()

        text.textColor = UIColor.white
        text.translatesAutoresizingMaskIntoConstraints = false
        text.textAlignment = .center
        text.font = UIFont.boldSystemFont(ofSize: 15)
        return text
    }()
    
    fileprivate let icon: UIImageView = {
       let image = UIImageView()
        image.image = #imageLiteral(resourceName: "Icon ionic-ios-pin")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(bg)
        contentView.addSubview(gradient)
        contentView.addSubview(title)
        contentView.addSubview(icon)
        contentView.addSubview(describ)

        bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        bg.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        bg.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        gradient.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        gradient.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        gradient.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10).isActive = true
        gradient.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
        title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10).isActive = true
        title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        
        icon.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -45).isActive = true
        icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 25).isActive = true
        icon.widthAnchor.constraint(equalToConstant: 7).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        describ.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -41).isActive = true
        describ.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 35).isActive = true
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
