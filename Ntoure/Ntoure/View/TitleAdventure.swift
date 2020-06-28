//
//  TitleAdventure.swift
//  Ntoure
//
//  Created by Vitor Bryan on 22/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class TitleAdventure: UIView {
    var data: Adventure?
    var viewCon = SelectedAdventureViewController()
    var numberOfRows = 0
    
    lazy var title: UILabel = {
        var title = UILabel()
        title.font = .placeTitle
        title.attributedText = NSMutableAttributedString(string: " ", attributes: placeTitle)
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 1
        title.textColor = .titleColor
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var locationIcon: UIImageView = {
        let locationIcon  = UIImageView()
        locationIcon.image = UIImage(named: "locationIcon")
        locationIcon.contentMode = .scaleAspectFill
        locationIcon.clipsToBounds = true
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        return locationIcon
    }()
    
    lazy var typeIcon: UIImageView = {
        let typeIcon  = UIImageView()
        typeIcon.contentMode = .scaleAspectFill
        typeIcon.clipsToBounds = true
        typeIcon.translatesAutoresizingMaskIntoConstraints = false
        return typeIcon
    }()

    lazy var category: UILabel = {
        let category = UILabel()
        category.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        category.adjustsFontSizeToFitWidth = true
        category.numberOfLines = 1
        category.textColor = .titleColor
        category.translatesAutoresizingMaskIntoConstraints = false
        return category
    }()
    
    lazy var locationDistance: UILabel = {
        let location = UILabel()
        location.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        location.adjustsFontSizeToFitWidth = true
        location.numberOfLines = 1
        location.textColor = .titleColor
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()

    lazy var savedIcon: UIButton = {
        let saved = UIButton()
        saved.setImage(UIImage(named: "saved"), for: .normal)
        saved.adjustsImageWhenHighlighted = true // ver o comportamento disso
        saved.translatesAutoresizingMaskIntoConstraints = false
        saved.addTarget(self, action: #selector(picker), for: .touchUpInside)
        return saved
    }()

    @objc func picker() {
        let alertController = UIAlertController(title: "Lucas", message: "Currencies", preferredStyle: .actionSheet)
        
        let margin: CGFloat = 8.0
        let rect = CGRect(x: margin, y: margin, width: alertController.view.bounds.size.width - margin * 4.0, height: 100.0)
        let customView = tableViewAlert(frame: rect)
        guard let data = data else {return}
        customView.data = data
        alertController.view.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: alertController.view.topAnchor, constant: 45).isActive = true
        customView.rightAnchor.constraint(equalTo: alertController.view.rightAnchor).isActive = true
        customView.leftAnchor.constraint(equalTo: alertController.view.leftAnchor).isActive = true
        customView.heightAnchor.constraint(equalToConstant: CGFloat(self.numberOfRows * 57)).isActive = true
        
        alertController.view.translatesAutoresizingMaskIntoConstraints = false
        alertController.view.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 56).isActive = true
        
        alertController.addAction(UIAlertAction(title: "ok", style: .destructive, handler: nil))
        
        self.viewCon.present(alertController, animated: true, completion: nil)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        roundCorners(corners: [.bottomLeft, .topLeft], radius: 10)
        addShadow()
    }

}

extension TitleAdventure: ViewCode {
    func buildHierarchy() {
        addSubview(title)
        addSubview(locationIcon)
        addSubview(locationDistance)
        addSubview(savedIcon)
        addSubview(typeIcon)
        addSubview(category)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: savedIcon.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            locationIcon.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            locationIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            locationIcon.trailingAnchor.constraint(equalTo: locationDistance.leadingAnchor, constant: -5),
            locationIcon.widthAnchor.constraint(equalTo: locationIcon.heightAnchor, multiplier: 0.7),
            locationIcon.heightAnchor.constraint(equalTo: locationDistance.heightAnchor, multiplier: 0.5)
        ])

        NSLayoutConstraint.activate([
            locationDistance.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            savedIcon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            savedIcon.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
        ])
        
        NSLayoutConstraint.activate([
            typeIcon.centerYAnchor.constraint(equalTo: locationDistance.centerYAnchor),
            typeIcon.leadingAnchor.constraint(equalTo: locationDistance.trailingAnchor, constant: 16),
            typeIcon.widthAnchor.constraint(equalToConstant: 15),
            typeIcon.heightAnchor.constraint(equalToConstant: 15)
        ])
        
        NSLayoutConstraint.activate([
           category.centerYAnchor.constraint(equalTo: typeIcon.centerYAnchor),
           category.leadingAnchor.constraint(equalTo: typeIcon.trailingAnchor, constant: 4),
           category.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])
       
    }

    func aditionalConfigurations() {
        backgroundColor = .backgroundAcessory
    }
    
    func addShadow() {
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: 10).cgPath
        layer.shadowColor = UIColor.red.cgColor
        layer.shadowOffset = CGSize(width: 5.0, height: 5.0)
        layer.shadowOpacity = 0.9
        layer.shadowRadius = 25.0
    }
}
