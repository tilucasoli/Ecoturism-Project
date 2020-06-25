//
//  SelectedAdventureViewController.swift
//  Ntoure
//
//  Created by Vitor Bryan on 19/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class SelectedAdventureViewController: UIViewController, Delegate{
    
    func showModal() {
        let modalVC = ModalViewController()
        modalVC.modalPresentationStyle = .formSheet
        modalVC.data = data
        present(modalVC, animated: true, completion: nil)
        
    }
    
    var data: Adventure? {
        didSet{
            guard let data = data else{return}
            titleComponent.title.text = data.title
            titleComponent.locationDistance.text = data.distancia
            titleComponent.category.text = data.categoria
//            collectionComponent.images[0] = data.image //change dataimage type to array
            
            switch data.categoria {
            case "Parapente":
                titleComponent.typeIcon.image = UIImage(named: "parapenteIcon")
            case "Jangada":
                titleComponent.typeIcon.image = UIImage(named: "jangadaIcon")
            case "Kitesurf":
                titleComponent.typeIcon.image = UIImage(named: "kitesurfIcon")
            default:
                titleComponent.typeIcon.image = nil
            }
        }
    }

    lazy var collectionComponent: CollectionPhotoInformation = {
        let collection = CollectionPhotoInformation()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    lazy var titleComponent: TitleAdventure = {
        let locationMap = TitleAdventure(frame: .zero, title: "Canoa Quebrada", locationDistance: "163km")
        locationMap.delegate = self
        locationMap.translatesAutoresizingMaskIntoConstraints = false
        return locationMap
    }()
    
    lazy var informationComponent: InformationView = {
        let informationComponent = InformationView(frame: .zero, placeDescription: "Canoa Quebrada é uma praia localizada no litoral leste do Estado do Ceará. A sua paisagem é caracterizada por dunas e falésias avermelhadas de até trinta metros acima do nível do mar.")
        informationComponent.translatesAutoresizingMaskIntoConstraints = false
        return informationComponent
    }()
    
    lazy var carefulComponent: InformationView = {
        let careful = InformationView(frame: .zero, placeDescription: """
 1. Não jogue lixo na praia
 2. Leve os equipamentos de segurança
 3. Verifique o mar antes de entrar
 """)
        careful.title.text = "Cuidados"
        careful.translatesAutoresizingMaskIntoConstraints = false
        return careful
    }()
    
    lazy var contactComponent: ContactView = {
        let contact = ContactView(frame: .zero, placeDescription: "+55 99999-9999", title: "Contato")
        contact.translatesAutoresizingMaskIntoConstraints = false
        return contact
    }()
    
    lazy var addressComponent: ContactView = {
        let address = ContactView(frame: .zero, placeDescription: "Av. da Integração, 1, Aracati - CE, 62800-000", title: "Endereço")
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
            titleComponent.widthAnchor.constraint(equalTo: collectionComponent.widthAnchor, multiplier: 0.8),
            titleComponent.heightAnchor.constraint(equalTo: collectionComponent.heightAnchor, multiplier: 0.3),
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

