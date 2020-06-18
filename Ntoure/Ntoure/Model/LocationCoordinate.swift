//
//  LocationCoordinate.swift
//  Ntoure
//
//  Created by Anderson Alencar on 17/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class LocationCoordinate: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    let title: String?
    let locationName: String?
    var subtitle: String? {
      return locationName
    }
    
    var mapItem: MKMapItem? {
        guard let location = locationName else {return nil}
        let addressDict = [CNPostalAddressStreetKey: location]
        let placeMark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placeMark)
        mapItem.name = title
        return mapItem
    }
    init(title: String?, locationName: String?, coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.title = title
        self.locationName = locationName
    }
}
