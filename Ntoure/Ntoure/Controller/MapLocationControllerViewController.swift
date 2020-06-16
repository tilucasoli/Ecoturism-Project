//
//  MapLocationControllerViewController.swift
//  Ntoure
//
//  Created by Anderson Alencar on 15/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit
import MapKit

class MapLocationControllerViewController: UIViewController {

    let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)

    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        let initialLocation = CLLocation(latitude: 37.3348469, longitude: -122.01139216)
        let regionRadius: CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        mapView.translatesAutoresizingMaskIntoConstraints = false
        return mapView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        setUp()
    }

}

extension MapLocationControllerViewController: ViewCode {
    func buildHierarchy() {
        view.addSubview(mapView)
    }
    
    func setUpLayoutConstraints() {
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func aditionalConfigurations() {
        view.backgroundColor = .white
    }
}

