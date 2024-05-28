//
//  Photo.swift
//  Challenge4
//
//  Created by Joohee Kim on 5/28/24.
//

import Foundation

struct Photo: Codable {
    var name: String
    var image: String
    
    mutating func updateName(_ name: String) {
        self.name = name
    }
}
