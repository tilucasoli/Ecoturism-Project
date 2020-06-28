//
//  SelectedLocationViewController.swift
//  Ntoure
//
//  Created by Anderson Alencar on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit
import MapKit

class SelectedLocationViewController: UIViewController, MyDelegate {
    
    var placeIDReference: UUID?
    
    let manager = APIManager()
    
    var place: Place!
    
    lazy var collectionComponent: CollectionPhotoInformation = {
        let collection = CollectionPhotoInformation()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var locationMapComponent: LocationMapView = {
        let locationMap = LocationMapView(frame: .zero)
        locationMap.delegate = self
        locationMap.translatesAutoresizingMaskIntoConstraints = false
        return locationMap
    }()
    
    lazy var informationComponent: InformationView = {
        let informationComponent = InformationView()
        informationComponent.translatesAutoresizingMaskIntoConstraints = false
        return informationComponent
    }()
    
    lazy var servicesComponent: AdventureView = {
        let servicesComponent = AdventureView()
        servicesComponent.translatesAutoresizingMaskIntoConstraints = false
        servicesComponent.delegate = self
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
        
        manager.fetchPlaceInformations(placeID: placeIDReference!) { (place) in
            DispatchQueue.main.async {
                self.place = place
                self.informationComponent.placeDescription.text = place.description
                self.collectionComponent.images = place.presentationPhotos
                self.locationMapComponent.title.text = place.namePlace
                self.locationMapComponent.locationDistance.text = place.distance
            }
        }
        
        manager.fetchStandardAdventures(placeID: placeIDReference!) { (adventures) in
            DispatchQueue.main.async {
                self.servicesComponent.guideList = adventures
            }
        }
    }

    override func viewWillLayoutSubviews() {
        setUp()
    }
    
    func onButtonTapped() {
        let nextViewController = AdventureViewController()
        nextViewController.placeIDReference = placeIDReference
        nextViewController.headerTable = locationMapComponent.title.text
        navigationController?.pushViewController(nextViewController, animated: true)
    }

    func adventureTapped(data: Adventure) {
        let nextViewController = SelectedAdventureViewController()
        nextViewController.data = data
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}

extension SelectedLocationViewController: PresentMapLocationDelegate {
    func presentLocation() {
        let mapController = MapLocationControllerViewController()
        mapController.location = LocationCoordinate(title: place.namePlace, locationName: "Região do Ceará", coordinate: CLLocationCoordinate2D(latitude: Double(place.location[0])!, longitude: Double(place.location[1])!))
        navigationController?.pushViewController(mapController, animated: true)
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
            locationMapComponent.widthAnchor.constraint(equalTo: collectionComponent.widthAnchor, multiplier: 0.89),
            locationMapComponent.heightAnchor.constraint(equalTo: collectionComponent.heightAnchor, multiplier: 0.25),
            locationMapComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height*0.65)

        ])

        NSLayoutConstraint.activate([
            informationComponent.topAnchor.constraint(equalTo: locationMapComponent.bottomAnchor, constant: 16),
            informationComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            servicesComponent.topAnchor.constraint(equalTo: informationComponent.bottomAnchor, constant: 16),
            servicesComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            servicesComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            servicesComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    func aditionalConfigurations() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
    }
}
