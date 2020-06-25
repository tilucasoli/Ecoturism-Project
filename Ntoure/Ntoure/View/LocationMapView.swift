//
//  LocationMapView.swift
//  Ntoure
//
//  Created by Anderson Alencar on 10/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class LocationMapView: UIView {
    
    weak var delegate: PresentMapLocationDelegate?
    
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

    lazy var locationDistance: UILabel = {
        let location = UILabel()
        location.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        location.adjustsFontSizeToFitWidth = true
        location.numberOfLines = 1
        location.textColor = .titleColor
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()

    lazy var mapLocation: UIButton = {
        let mapLocation = UIButton()
        mapLocation.setImage(UIImage(named: "mapIcon"), for: .normal)
        mapLocation.adjustsImageWhenHighlighted = true // ver o comportamento disso
        mapLocation.addTarget(self, action: #selector(goToMapController), for: .touchUpInside)
        mapLocation.translatesAutoresizingMaskIntoConstraints = false
        return mapLocation
    }()

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

    @objc func goToMapController() {
        delegate?.presentLocation()
    }
}

extension LocationMapView: ViewCode {
    func buildHierarchy() {
        addSubview(title)
        addSubview(locationIcon)
        addSubview(locationDistance)
        addSubview(mapLocation)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 6),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: mapLocation.leadingAnchor)
//            title.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.4)
        ])

        NSLayoutConstraint.activate([
            locationIcon.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 4),
            locationIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17),
            locationIcon.trailingAnchor.constraint(equalTo: locationDistance.leadingAnchor, constant: -5),
            locationIcon.widthAnchor.constraint(equalTo: locationIcon.heightAnchor, multiplier: 0.7),
            locationIcon.heightAnchor.constraint(equalTo: locationDistance.heightAnchor, multiplier: 0.5)
        ])

        NSLayoutConstraint.activate([
            locationDistance.centerYAnchor.constraint(equalTo: locationIcon.centerYAnchor),
            locationDistance.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.3)
        ])

        NSLayoutConstraint.activate([
            mapLocation.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            mapLocation.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
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

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
