//
//  Person.swift
//  Project10
//
//  Created by Joohee Kim on 5/27/24.
//

import UIKit

class Person: NSObject {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}