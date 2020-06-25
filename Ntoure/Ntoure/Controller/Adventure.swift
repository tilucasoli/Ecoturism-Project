//
//  Adventure.swift
//  Ntoure
//
//  Created by Larissa Uchoa on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

struct Adventure: Codable {
    var id: UUID
    var photoActivity: Data
    var activityName: String
    var location: [String]
    var category: Int
    var description: String
    var status: Bool
    var care: [String]
    var phoneNumber: String
    var address: String
    var place: PlaceAcessory
}

struct PlaceAcessory: Codable {
    var id: UUID
}
