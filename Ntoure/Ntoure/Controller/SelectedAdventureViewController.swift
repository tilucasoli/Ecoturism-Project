//
//  SelectedAdventureViewController.swift
//  Ntoure
//
//  Created by Vitor Bryan on 19/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class SelectedAdventureViewController: UIViewController {

    var data: Adventure? {
        didSet {
            guard let data = data else { return }
            titleComponent.title.text = data.activityName
            titleComponent.locationDistance.text = "\(Int.random(in: 1...4)) km"
            
            switch data.category {
            case 0:
                titleComponent.typeIcon.image = UIImage(named: "trilha")
                titleComponent.category.text = "Trilha"
            case 1, 6:
                titleComponent.typeIcon.image = UIImage(named: "boat")
                titleComponent.category.text = "Barco"
            case 2:
                titleComponent.typeIcon.image = UIImage(named: "windsurf")
                titleComponent.category.text = "Windsurf"
            case 3:
                titleComponent.typeIcon.image = UIImage(named: "kitesurfIcon")
                titleComponent.category.text = "Kitesurf"
            case 4:
                titleComponent.typeIcon.image = UIImage(named: "surfing")
                titleComponent.category.text = "Stand Up Paddle"
            case 5:
                titleComponent.typeIcon.image = UIImage(named: "parapenteIcon")
                titleComponent.category.text = "Parapente"
            default:
                titleComponent.typeIcon.image = nil
                titleComponent.category.text = "Stand Up Paddle"
            }
            informationComponent.placeDescription.text = data.description
            contactComponent.placeDescription.setTitle("85 " + data.phoneNumber, for: .normal)
            addressComponent.placeDescription.setTitle(data.address, for: .normal)
            collectionComponent.images = [data.photoActivity]
        }
    }

    lazy var collectionComponent: CollectionPhotoInformation = {
        let collection = CollectionPhotoInformation()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var titleComponent: TitleAdventure = {
        var locationMap = TitleAdventure(frame: .zero)
        guard let data = data else { return locationMap}
        locationMap.data = data
        locationMap.numberOfRows = PlistManager().read().count
        locationMap.translatesAutoresizingMaskIntoConstraints = false
        locationMap.viewCon = self
        return locationMap
    }()
    
    lazy var informationComponent: InformationView = {
        let informationComponent = InformationView()
        informationComponent.translatesAutoresizingMaskIntoConstraints = false
        return informationComponent
    }()
    
    lazy var carefulComponent: InformationView = {
        let careful = InformationView()
        careful.title.text = "Cuidados"
        careful.translatesAutoresizingMaskIntoConstraints = false
        return careful
    }()
    
    lazy var contactComponent: ContactView = {
        let contact = ContactView(frame: .zero, title: "Contato")
        contact.translatesAutoresizingMaskIntoConstraints = false
        return contact
    }()
    
    lazy var addressComponent: ContactView = {
        let address = ContactView(frame: .zero, title: "Endereço")
        address.translatesAutoresizingMaskIntoConstraints = false
        return address
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
    override func viewWillAppear(_ animated: Bool) {
        titleComponent.numberOfRows = PlistManager().read().count
    }
    
    override func viewWillLayoutSubviews() {
        setUp()
    }
    
}
extension SelectedAdventureViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(collectionComponent)
        view.addSubview(accessoryView)
        view.addSubview(titleComponent)
        view.addSubview(informationComponent)
        view.addSubview(carefulComponent)
        view.addSubview(contactComponent)
        view.addSubview(addressComponent)
    }

    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            collectionComponent.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionComponent.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionComponent.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3)
        ])
        
        NSLayoutConstraint.activate([
            accessoryView.centerXAnchor.constraint(equalTo: titleComponent.centerXAnchor),
            accessoryView.centerYAnchor.constraint(equalTo: titleComponent.centerYAnchor),
            accessoryView.widthAnchor.constraint(equalTo: titleComponent.widthAnchor),
            accessoryView.heightAnchor.constraint(equalTo: titleComponent.heightAnchor)
        ])

        NSLayoutConstraint.activate([
            titleComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            titleComponent.widthAnchor.constraint(equalTo: collectionComponent.widthAnchor, multiplier: 0.89),
            titleComponent.heightAnchor.constraint(equalTo: collectionComponent.heightAnchor, multiplier: 0.26),
            titleComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.bounds.height*0.65)

        ])

        NSLayoutConstraint.activate([
            informationComponent.topAnchor.constraint(equalTo: titleComponent.bottomAnchor, constant: 16),
            informationComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            informationComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            carefulComponent.topAnchor.constraint(equalTo: informationComponent.bottomAnchor, constant: 16),
            carefulComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carefulComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contactComponent.topAnchor.constraint(equalTo: carefulComponent.bottomAnchor, constant: 16),
            contactComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contactComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            addressComponent.topAnchor.constraint(equalTo: contactComponent.bottomAnchor, constant: 16),
            addressComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            addressComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    func aditionalConfigurations() {
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
    }
}
