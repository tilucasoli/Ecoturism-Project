//
//  Guide.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class Guide: Codable {
    var name: String
    var adventures = [Adventure]()
    var image: String?

    func addServiceInTodo(service: Adventure) {
        adventures.append(service)
    }
    
    func getImage() -> UIImage? {
        let data = adventures.first?.photoActivity
        guard let datalet = data else {
            return nil
        }
        return UIImage(data: datalet)
    }
    
    required init(name: String, image: String?) {
        self.name = name
        self.image = image
    }
}
