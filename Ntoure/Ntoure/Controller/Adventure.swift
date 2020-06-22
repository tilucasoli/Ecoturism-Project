//
//  Adventure.swift
//  Ntoure
//
//  Created by Larissa Uchoa on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

struct Adventure: Codable {
    var imageData: Data
    var title: String
    var categoria: String
    var distancia: String
    
    var done: Bool = false
    
    init(image: UIImage, title: String, categoria: String, distancia: String, done: Bool) {
        self.imageData = image.pngData()!
        self.title = title
        self.categoria = categoria
        self.distancia = distancia
        self.done = done

    }
    
    func getImage() -> UIImage? {
        let image = UIImage(data: self.imageData)
        guard let img = image else { return nil }
        return img
    }
}
