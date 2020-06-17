//
//  MapLocationControllerViewController.swift
//  Ntoure
//
//  Created by Anderson Alencar on 15/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class MapLocationControllerViewController: UIViewController {
    
    let cumbuco = CLLocationCoordinate2D(latitude: -3.6467904, longitude: -38.69615054)
    let apple = CLLocationCoordinate2D(latitude: 37.3348469, longitude: -122.01139216)
    let location = LocationCoordinate(title: "Cumbuco", locationName: "Bairro no Ceará", coordinate: CLLocationCoordinate2D(latitude: -3.6467904, longitude: -38.69615054))

    lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        //set center of location
        let initialLocation = CLLocation(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let regionRadius: CLLocationDistance = 2000
        let coordinateRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
        //set camera
        let mapCamera = MKMapView.CameraBoundary(coordinateRegion: coordinateRegion)
        mapView.setCameraBoundary(mapCamera, animated: true)
        //set zoom camera
        let zoomRange = MKMapView.CameraZoomRange(maxCenterCoordinateDistance: 150000)
        mapView.setCameraZoomRange(zoomRange, animated: true)
        mapView.addAnnotation(location)
        //delegate
        mapView.delegate = self
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

extension MapLocationControllerViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Annotation"
        guard let annotation = annotation as? LocationCoordinate else {return nil}
        var view: MKMarkerAnnotationView
        
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view.canShowCallout = true
            view.calloutOffset = CGPoint(x: -5, y: -5)
            view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
        }
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        guard let location = view.annotation as? LocationCoordinate else {
          return
        }
        let launchOptions = [
          MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving
        ]
        location.mapItem?.openInMaps(launchOptions: launchOptions)
    }
}
