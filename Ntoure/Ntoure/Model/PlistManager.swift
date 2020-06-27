//
//  PlistManager.swift
//  Ntoure
//
//  Created by Lucas Oliveira on 22/06/20.
//  Copyright © 2020 Lucas Oliveira. All rights reserved.
//

import UIKit

public class PlistManager {
    
    var plistURL: URL {
      let documents = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      return documents.appendingPathComponent("GuideData.plist")
    }
    
    func write(guide: [Guide]) -> Bool {
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        if let data = try? encoder.encode(guide) {
            if FileManager.default.fileExists(atPath: plistURL.path) {
                // Update an existing plist
                try? data.write(to: plistURL)
                return true
            } else {
                // Create a new plist
                FileManager.default.createFile(atPath: plistURL.path, contents: data, attributes: nil)
                return true
            }
        }
        return false
    }
    
    func read() -> [Guide] {
        let decoder = PropertyListDecoder()
        do {
            let infoPlistData = try Data(contentsOf: plistURL)
            if let arr = try decoder .decode([Guide].self, from: infoPlistData) as? [Guide] {
                return arr
            }
        } catch {
            print(error)
        }
        return []
    }
}
