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
    
    func careStringTemplate() -> String {
        var str = ""
        for index in 0..<care.count {
            if index == care.count-1 {
                str += "\(index+1). \(care[index])"
            } else {
            str += "\(index+1). \(care[index])\n"
            }
        }
        return str
    }
}
struct PlaceAcessory: Codable {
    var id: UUID
}
