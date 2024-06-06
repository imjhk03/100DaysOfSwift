//
//  Capital.swift
//  Project16
//
//  Created by Joohee Kim on 6/4/24.
//

import MapKit
import UIKit

class Capital: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String
    var wikipedia: String
    
    init(title: String, coordinate: CLLocationCoordinate2D, info: String, wikipedia: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
        self.wikipedia = wikipedia
    }
}
