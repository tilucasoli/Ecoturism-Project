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
    var categoriaLabel = UILabel()
    var categoriaImage = UIImageView()
    var distanciaLabel = UILabel()
    var distanciaImage = UIImageView()
    var viewBackground = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        viewBackground.addSubview(adventureImageView)
        viewBackground.addSubview(adventureTitleLabel)
        viewBackground.addSubview(categoriaLabel)
        viewBackground.addSubview(distanciaLabel)
        viewBackground.addSubview(categoriaImage)
        viewBackground.addSubview(distanciaImage)
        
        addSubview(viewBackground)
        
        configureView()
        configureImageView()
        configureTitleLabel()
        configureSubtitle()
        setViewConstraints()
        setImageConstraints()
        setTitleLabelConstraints()
        setSubtitleConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(adventure: Adventure) {
        adventureImageView.image = UIImage(data: adventure.imageData)
        adventureTitleLabel.text = adventure.title
        
        categoriaLabel.text = adventure.categoria
        distanciaLabel.text = adventure.distancia
        
        switch adventure.categoria {
        case "Parapente":
            categoriaImage.image = UIImage(named: "parapenteIcon")
        case "Jangada":
            categoriaImage.image = UIImage(named: "jangadaIcon")
        case "Kitesurf":
            categoriaImage.image = UIImage(named: "kitesurfIcon")
        default:
            categoriaImage.image = nil
        }
        
        distanciaImage.image = #imageLiteral(resourceName: "location")
    }
    
    func configureView() {
        viewBackground.layer.cornerRadius = 10
        viewBackground.clipsToBounds = true
        viewBackground.backgroundColor = .white
        viewBackground.frame = CGRect(x: 16, y: 8, width: UIScreen.main.bounds.size.width - 32, height: 64)
        
        viewBackground.layer.shadowColor = UIColor.black.cgColor
        viewBackground.layer.shadowOpacity = 0.02
        viewBackground.layer.shadowOffset = CGSize(width: 0, height: 3)
        viewBackground.layer.shadowRadius = 6
        viewBackground.layer.masksToBounds = false
    }
    
    func configureImageView() {
        adventureImageView.layer.cornerRadius = 8
        adventureImageView.clipsToBounds = true
    }
    
    func configureTitleLabel() {
        adventureTitleLabel.numberOfLines = 0
        adventureTitleLabel.adjustsFontSizeToFitWidth = true
        
        adventureTitleLabel.font = UIFont(name: "SF Pro Display", size: 17)
        adventureTitleLabel.font = categoriaLabel.font.withSize(17)
    }
    
    func configureSubtitle() {
        categoriaLabel.adjustsFontSizeToFitWidth = true
        distanciaLabel.adjustsFontSizeToFitWidth = true
        
        categoriaLabel.textColor = .gray
        distanciaLabel.textColor = .gray
        
        categoriaLabel.font = UIFont(name: "SF Pro Text", size: 15)
        categoriaLabel.font = categoriaLabel.font.withSize(15)
        distanciaLabel.font = UIFont(name: "SF Pro Text", size: 15)
        distanciaLabel.font = categoriaLabel.font.withSize(15)
        
        categoriaImage.frame = CGRect(x: 0, y: 0, width: 10, height: 12)
        distanciaImage.frame = CGRect(x: 0, y: 0, width: 9, height: 13)
    }
    
    func setViewConstraints() {
        viewBackground.translatesAutoresizingMaskIntoConstraints = false
        viewBackground.topAnchor.constraint(equalTo: topAnchor).isActive = true
        viewBackground.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        viewBackground.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
    }
    
    func setImageConstraints() {
        adventureImageView.translatesAutoresizingMaskIntoConstraints = false
        
        adventureImageView.topAnchor.constraint(equalTo: viewBackground.topAnchor, constant: 7).isActive = true
        adventureImageView.bottomAnchor.constraint(equalTo: viewBackground.bottomAnchor, constant: -7).isActive = true
        adventureImageView.leadingAnchor.constraint(equalTo: viewBackground.leadingAnchor, constant: 6).isActive = true
        adventureImageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        adventureImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setTitleLabelConstraints() {
        adventureTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        adventureTitleLabel.topAnchor.constraint(equalTo: adventureImageView.topAnchor, constant: 5).isActive = true
        adventureTitleLabel.leadingAnchor.constraint(equalTo: adventureImageView.trailingAnchor, constant: 16).isActive = true
        adventureTitleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        adventureTitleLabel.trailingAnchor.constraint(equalTo: viewBackground.trailingAnchor, constant: -6).isActive = true
    }
    
    func setSubtitleConstraints() {
        
        // Constraints da Categoria Image
        categoriaImage.translatesAutoresizingMaskIntoConstraints = false
        categoriaImage.leadingAnchor.constraint(equalTo: adventureImageView.trailingAnchor, constant: 16).isActive = true
        categoriaImage.topAnchor.constraint(equalTo: adventureTitleLabel.bottomAnchor, constant: 6).isActive = true
        categoriaImage.widthAnchor.constraint(equalToConstant: 12).isActive = true
        categoriaImage.heightAnchor.constraint(equalToConstant: 13).isActive = true

        // Constraints da Categoria Label
        categoriaLabel.translatesAutoresizingMaskIntoConstraints = false
        categoriaLabel.centerYAnchor.constraint(equalTo: categoriaImage.centerYAnchor).isActive = true
        categoriaLabel.leadingAnchor.constraint(equalTo: categoriaImage.trailingAnchor, constant: 5).isActive = true
//        categoriaLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        // Constraints da Distancia Image
        distanciaImage.translatesAutoresizingMaskIntoConstraints = false
        distanciaImage.leadingAnchor.constraint(equalTo: categoriaLabel.trailingAnchor, constant: 16).isActive = true
        distanciaImage.centerYAnchor.constraint(equalTo: categoriaImage.centerYAnchor).isActive = true
        distanciaImage.widthAnchor.constraint(equalToConstant: 8).isActive = true
        distanciaImage.heightAnchor.constraint(equalToConstant: 12).isActive = true
        
        //Constraints da Distancia Label
        distanciaLabel.translatesAutoresizingMaskIntoConstraints = false
        distanciaLabel.centerYAnchor.constraint(equalTo: categoriaImage.centerYAnchor).isActive = true
        distanciaLabel.leadingAnchor.constraint(equalTo: distanciaImage.trailingAnchor, constant: 5).isActive = true
        distanciaLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
    }
}
