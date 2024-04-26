/*:
 [< Previous](@previous)
 # Day 14 – Swift review, day two
 */

import Foundation

// Functions
func favoriteAlbum(name: String) {
    print("My favorite is \(name)")
}

favoriteAlbum(name: "Fearless")


func printAlbumRelease(name: String, year: Int) {
    print("\(name) was released in \(year)")
}

printAlbumRelease(name: "Fearless", year: 2008)

// External and internal parameter names
func countLetters(in string: String) {
    print("The string \(string) has \(string.count) letters.")
}

countLetters(in: "Hello")

// Return values
func albumIsTaylor(name: String) -> Bool {
    if name == "Taylor Swift" { return true }
    if name == "Fearless" { return true }
    return false
}

if albumIsTaylor(name: "Taylor Swift") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

if albumIsTaylor(name: "The White Album") {
    print("That's one of hers!")
} else {
    print("Who made that?")
}

// Optionals
/*
func getHaterStatus(weather: String) -> String? {
    if weather == "sunny" {
        return nil
    } else {
        return "Hate"
    }
}

var status = getHaterStatus(weather: "rainy")


if let unwrappedStatus = status {
    // unwrappedStatus contains a non-optional string
} else {
    // in case you want an else block, here you go...
}

func takeHaterAction(status: String) {
    if status == "Hate" {
        print("Hating")
    }
}

if let haterStatus = getHaterStatus(weather: "rainy") {
    takeHaterAction(status: haterStatus)
}
*/
/*
func yearAlbumRelease(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}
*/

var items = ["James", "John", "Sally"]

func position(of string: String, in array: [String]) -> Int {
    for i in 0..<array.count {
        if array[i] == string {
            return i
        }
    }
    
    return 0
}

let jamesPosition = position(of: "James", in: items)
let johnPosition = position(of: "John", in: items)
let sallyPosition = position(of: "Sally", in: items)
let bobPosition = position(of: "Bob", in: items)

// Force unwrapping optionals
func yearAlbumRelease(name: String) -> Int? {
    if name == "Taylor Swift" { return 2006 }
    if name == "Fearless" { return 2008 }
    return nil
}

var year = yearAlbumRelease(name: "Taylor Swift")

if year == nil {
    print("There was an error")
} else {
    print("It was released in \(year!)")
}

// Implicitly unwrapped optionals
var name: String = "Paul"
var name2: String? = "Bob"
var name3: String! = "Sophie"

// Optional chaining
func albumReleased(year: Int) -> String? {
    switch year {
    case 2006: return "Taylor Swift"
    case 2008: return "Fearless"
    default: return nil
    }
}

let album = albumReleased(year: 2006)?.uppercased()
print("The album is \(album)")

// The nil coalescing operator
let album2 = albumReleased(year: 2006) ?? "unkown"
print("The album is \(album2)")


// Enumerations
/*
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .cloud, .wind:
        return "dislike"
    case .rain:
        return "hate"
//    case .snow:
//        <#code#>
    }
}

getHaterStatus(weather: .cloud)
*/

// Enums with additional values
enum WeatherType {
    case sun
    case cloud
    case rain
    case wind(speed: Int)
    case snow
}

func getHaterStatus(weather: WeatherType) -> String? {
    switch weather {
    case .sun:
        return nil
    case .wind(let speed) where speed < 10:
        return "meh"
    case .cloud, .wind:
        return "dislike"
    case .rain, .snow:
        return "hate"
    }
}


// Structs
struct Person {
    var clothes: String
    var shoes: String
}

let taylor = Person(clothes: "T-shirts", shoes: "sneakers")
let other = Person(clothes: "short skirts", shoes: "high heels")

print(taylor.clothes)
print(other.shoes)

var taylorCopy = taylor
taylorCopy.shoes = "flip flops"

print(taylor)
print(taylorCopy)

// Functions inside structs
struct Person2 {
    var clothes: String
    var shoes: String
    
    func describe() {
        print("I like wearing \(clothes) with \(shoes)")
    }
}


// Classes
class Person3 {
    var clothes: String
    var shoes: String
    
    init(clothes: String, shoes: String) {
        self.clothes = clothes
        self.shoes = shoes
    }
}

// Class inheritance
class Singer {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

class CountrySinger: Singer {
    override func sing() {
        print("Trucks, guitars, and liquor")
    }
}

class HeavyMetalSinger: Singer {
    var noiseLevel: Int
    
    init(name: String, age: Int, noiseLevel: Int) {
        self.noiseLevel = noiseLevel
        super.init(name: name, age: age)
    }
    
    override func sing() {
        print("Grrrr rargh rargh rarrrrgh!")
    }
}

var taylor2 = CountrySinger(name: "Taylor", age: 25)
taylor2.name
taylor2.age
taylor2.sing()

// Working with Objective-C code
@objcMembers class Singer2 {
    var name: String
    var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func sing() {
        print("La la la la")
    }
}

//: [Next](@next)
