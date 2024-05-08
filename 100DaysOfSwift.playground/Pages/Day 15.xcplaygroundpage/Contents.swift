/*:
 [< Previous](@previous)
 # Day 15 – Swift review, day three
 */

import Foundation

// 1. Properties
/*
struct Person {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

taylor.describe()
other.describe()
*/
// Property observers
/*
struct Person {
    var clothes: String {
        willSet {
            updateUI(msg: "I'm changing from \(clothes) to \(newValue)")
        }
        
        didSet {
            updateUI(msg: "I just changed from \(oldValue) to \(clothes)")
        }
    }
}

func updateUI(msg: String) {
    print(msg)
}

var taylor = Person(clothes: "T-shirts")
taylor.clothes = "short skirts"
*/
// Computed properties
struct Person {
    var age: Int
    
    var ageInDogYears: Int {
        return age * 7
    }
}

var fan = Person(age: 25)
print(fan.ageInDogYears)


// 2. Static properties and methods
struct TaylorFan {
    static var favoriteSong = "Look What You Made Me Do"
    
    var name: String
    var age: Int
}

let fan = TaylorFan(name: "James", age: 25)
print(TaylorFan.favoriteSong)


// 3. Access control
class TaylorFan {
    fileprivate var name: String?
}


// 4. Polymorphism and typecasting
class Album {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func getPerformance() -> String {
        return "The album \(name) sold lots"
    }
}

class StudioAlbum: Album {
    var studio: String
    
    init(name: String, studio: String) {
        self.studio = studio
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The studio album \(name) sold lots"
    }
}

class LiveAlbum: Album {
    var location: String
    
    init(name: String, location: String) {
        self.location = location
        super.init(name: name)
    }
    
    override func getPerformance() -> String {
        return "The live album \(name) sold lots"
    }
}

var taylorSwift = StudioAlbum(name: "Taylor Swift", studio: "The Castles Studio")
var fearless = StudioAlbum(name: "Fearless", studio: "Aimeeland Studio")
var iTunesLive = LiveAlbum(name: "iTunes Live from SoHo", location: "New York")
var allAlbums: [Album] = [taylorSwift, fearless, iTunesLive]

for album in allAlbums {
    print(album.getPerformance())
}

// Converting types with typecasting
for album in allAlbums {
    print(album.getPerformance())

    if let studioAlbum = album as? StudioAlbum {
        print(studioAlbum.studio)
    } else if let liveAlbum = album as? LiveAlbum {
        print(liveAlbum.location)
    }
}

var allAlbums2: [Album] = [taylorSwift, fearless]

for album in allAlbums2 as! [StudioAlbum] {
    print(album.getPerformance())
    print(studioAlbum.studio)
}

for album in allAlbums2 as? [LiveAlbum] ?? [LiveAlbum]() {
    print(album.getPerformance())
    print(studioAlbum.location)
}

// Converting common types with initializers
let number = 5
let text = String(number)
print(text)


// 5. Closures
import UIKit

let vw = UIView()

UIView.animated(withDuration: 0.5) {
    vw.alpha = 0
}
