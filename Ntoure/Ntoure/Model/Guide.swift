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
    var todo = [Service]()
    var done = [Service]()
    
    init(name: String) {
        self.name = name
    }
    
    func addServiceInTodo(service: Service){
        todo.append(service)
        
    }
    
}
