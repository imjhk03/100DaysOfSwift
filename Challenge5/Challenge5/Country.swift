//
//  Country.swift
//  Challenge5
//
//  Created by Joohee Kim on 6/3/24.
//

import Foundation

struct Country: Codable {
    var country: String
    var capital_city: String
    var population: Int
    var official_language: String
    var currency: String
    var url: String
    var time_zone: String
    var flag: String
    
    func shareDetail() -> String {
        var populationString: String = "Population:"
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSize = 3
        formatter.usesGroupingSeparator = true
        
        if let formattedNumber = formatter.string(from: population as NSNumber) {
            populationString = "Population: \(formattedNumber)"
        }
        
        return """
        Capital city: \(capital_city),
        \(populationString),
        Official Language: \(official_language),
        Currency: \(currency),
        URL: \(url),
        Time zone: \(time_zone)
        """
    }
}
