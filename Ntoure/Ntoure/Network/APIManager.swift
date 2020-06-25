//
//  APIManager.swift
//  Ntoure
//
//  Created by Anderson Alencar on 25/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import Foundation

class APIManager {
    
    let url = URL(string: "https://ntoure2.herokuapp.com")
    let session = URLSession.shared
    
    func fetchPlace(completionHandler: @escaping ([CustomData]) -> Void) {
        
        let URL = url!.appendingPathComponent("/place/allReducePlaces")
        let task = session.dataTask(with: URL) { (data, response, error) in
            if error != nil {
                print("Error accessing swapi.co: \(String(describing: error))")
              return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                        print("Error with the response, unexpected status code: \(String(describing: response))")
              return
            }
            if let data = data,
              let places = try? JSONDecoder().decode([CustomData].self, from: data) {
                completionHandler(places)
            }
            
        }
        task.resume()
    }
}
