//
//  SelectedLocationViewController.swift
//  Ntoure
//
//  Created by Anderson Alencar on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class SelectedLocationViewController: UIViewController {

    lazy var collectionComponent: CollectionPhotoInformation = {
        let collection = CollectionPhotoInformation()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var locationMapComponent: LocationMapView = {
        let locationMap = LocationMapView(frame: .zero, title: "Parque Coco", locationDistance: "12km")
        locationMap.translatesAutoresizingMaskIntoConstraints = false
        return locationMap
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillLayoutSubviews() {
        setUp()
    }
}

extension SelectedLocationViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(collectionComponent)
        view.addSubview(locationMapComponent)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            collectionComponent.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionComponent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionComponent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])

        NSLayoutConstraint.activate([
            locationMapComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationMapComponent.widthAnchor.constraint(equalTo: collectionComponent.widthAnchor, multiplier: 0.8),
            locationMapComponent.heightAnchor.constraint(equalTo: collectionComponent.heightAnchor, multiplier: 0.3),
            locationMapComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height*0.65)

        ])
    }

    func aditionalConfigurations() {
        view.backgroundColor = .white
    }
}
