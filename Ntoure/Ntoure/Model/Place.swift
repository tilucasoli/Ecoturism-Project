//
//  Place.swift
//  Ntoure
//
//  Created by Anderson Alencar on 25/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import Foundation


struct Place: Codable {
    var id: UUID
    var namePlace: String
    var description: String
    var coverPhoto: Data
    var presentationPhotos: [Data]
    var location: [String]
    var distance: String
}
