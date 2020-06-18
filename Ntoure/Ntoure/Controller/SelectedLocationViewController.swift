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
        locationMap.delegate = self
        locationMap.translatesAutoresizingMaskIntoConstraints = false
        return locationMap
    }()
    
    lazy var informationComponent: InformationView = {
        let informationComponent = InformationView(frame: .zero, placeDescription: "Canoa Quebrada is a beach located in the east coast of Ceará State, Distant 163 km from Fortaleza and 12 km from the seat of the municipality of Aracati, to which it belongs.")
        informationComponent.translatesAutoresizingMaskIntoConstraints = false
        return informationComponent
    }()
    
    lazy var servicesComponent: AdventureView = {
        let servicesComponent = AdventureView()
        servicesComponent.translatesAutoresizingMaskIntoConstraints = false
        return servicesComponent
    }()
    
    lazy var accessoryView: UIView = {
        let shadow = UIView()
        shadow.translatesAutoresizingMaskIntoConstraints = false
        shadow.backgroundColor = .background
        shadow.layer.cornerRadius = 20
        shadow.layer.masksToBounds = false
        shadow.layer.shadowColor = UIColor.lightGray.cgColor
        shadow.layer.shadowOffset = CGSize(width: -6, height: 10)
        shadow.layer.shadowOpacity = 0.1
        shadow.layer.shadowRadius = 2
        return shadow
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
        view.addSubview(accessoryView)
        view.addSubview(locationMapComponent)
        
        view.addSubview(informationComponent)
        view.addSubview(servicesComponent)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            collectionComponent.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionComponent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionComponent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            accessoryView.centerXAnchor.constraint(equalTo: locationMapComponent.centerXAnchor),
            accessoryView.centerYAnchor.constraint(equalTo: locationMapComponent.centerYAnchor),
            accessoryView.widthAnchor.constraint(equalTo: locationMapComponent.widthAnchor),
            accessoryView.heightAnchor.constraint(equalTo: locationMapComponent.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            locationMapComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            locationMapComponent.widthAnchor.constraint(equalTo: collectionComponent.widthAnchor, multiplier: 0.8),
            locationMapComponent.heightAnchor.constraint(equalTo: collectionComponent.heightAnchor, multiplier: 0.3),
            locationMapComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height*0.65)

        ])

        NSLayoutConstraint.activate([
            informationComponent.topAnchor.constraint(equalTo: locationMapComponent.bottomAnchor, constant: 16),
            informationComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            informationComponent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
        
        NSLayoutConstraint.activate([
            servicesComponent.topAnchor.constraint(equalTo: informationComponent.bottomAnchor, constant: 20),
            servicesComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            servicesComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            servicesComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func aditionalConfigurations() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
    }
}

extension SelectedLocationViewController: PresentMapLocationDelegate {
    func presentLocation() {
        let mapController = MapLocationControllerViewController()
        self.present(mapController, animated: true, completion: nil)
    }
}
