//
//  LocationMapView.swift
//  Ntoure
//
//  Created by Anderson Alencar on 10/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class LocationMapView: UIView {

    lazy var title: UILabel = {
        var title = UILabel()
        title.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        title.adjustsFontSizeToFitWidth = true
        title.numberOfLines = 1
        title.textColor = UIColor(red: 0.15, green: 0.22, blue: 0.25, alpha: 1.00) // Mudar para cor de sistema
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()

    lazy var locationIcon: UIImageView = {
        let locationIcon  = UIImageView(frame: CGRect(x: 0, y: 0, width: 8, height: 12))
        locationIcon.image = UIImage(named: "locationIcon")
        locationIcon.contentMode = .scaleAspectFill
        locationIcon.translatesAutoresizingMaskIntoConstraints = false
        return locationIcon
    }()

    lazy var locationDistance: UILabel = {
        let location = UILabel()
        location.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        location.adjustsFontSizeToFitWidth = true
        location.numberOfLines = 1
        location.textColor = UIColor(red: 0.15, green: 0.22, blue: 0.25, alpha: 1.00) // Mudar para cor de sistema
        location.translatesAutoresizingMaskIntoConstraints = false
        return location
    }()

    lazy var mapLocation: UIButton = {
        let mapLocation = UIButton()
        mapLocation.setImage(UIImage(named: "mapIcon"), for: .normal)
        mapLocation.adjustsImageWhenHighlighted = true // ver o comportamento disso
        mapLocation.translatesAutoresizingMaskIntoConstraints = false
        return mapLocation
    }()

    init(frame: CGRect, title: String, locationDistance: String) {
        super.init(frame: frame)
        self.title.text = title
        self.locationDistance.text = locationDistance
        setUp()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   override func layoutSubviews() {
       roundCorners(corners: [.bottomLeft, .topLeft], radius: 10)
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
            title.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            title.trailingAnchor.constraint(equalTo: mapLocation.leadingAnchor),
            title.bottomAnchor.constraint(equalTo: locationIcon.topAnchor, constant: 10)
        ])

        NSLayoutConstraint.activate([
            locationIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            locationIcon.trailingAnchor.constraint(equalTo: locationDistance.leadingAnchor, constant: 10),
            locationIcon.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 10)
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
        backgroundColor = .lightGray
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
