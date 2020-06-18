//
//  Guide.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 09/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

class Guide {
    var name: String
    var todo = [Adventure]()
    var done = [Adventure]()

    init(name: String) {
        self.name = name
    }

    func addServiceInTodo(service: Adventure) {
        todo.append(service)
    }
}
