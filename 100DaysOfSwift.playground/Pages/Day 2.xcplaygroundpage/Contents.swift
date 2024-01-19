/*:
 [< Previous](@previous)
 # Day 2 – arrays, dictionaries, sets, and enums
 */

import Foundation

// Arrays
let john = "John Lennon"
let paul = "Paul McCartney"
let george = "George Harrison"
let ringo = "Ringo Starr"

let beatles = [john, paul, george, ringo]
beatles[1]

// Sets
let colors = Set(["red", "green", "blue"])
let colors2 = Set(["red", "green", "blue", "red", "blue"])

// Tuples
var name = (first: "Taylor", last: "Swift")
name.0
name.first

// Arrays vs sets vs tuple
let address = (house: 555, street: "Taylor Swift Avenue", city: "Nashville")
let set = Set(["aardvark", "astronaut", "azalea"])
let pythons = ["Eric", "Graham", "John", "Michael", "Terry", "Terry"]

// Dictionaries
let heights = [
    "Taylor Swift": 1.78,
    "Ed Sheeran": 1.73
]
heights["Taylor Swift"]

// Dictionary default values
let favoriteIceCream = [
    "Paul": "Chocolate",
    "Sophie": "Vanilla"
]

favoriteIceCream["Paul"]
favoriteIceCream["Charlotte"]
favoriteIceCream["Charlotte", default: "Unknown"]

// Creating empty collections
var teams = [String: String]()
teams["Paul"] = "Red"

var results = [Int]()

var words = Set<String>()
var numbers = Set<Int>()

var scores = Dictionary<String, Int>()
var results = Array<Int>()

// Enumerations
let result = "failure"
let result2 ="failed"
let result3 = "fail"

enum Result {
    case success
    case failure
}

let result4 = Result.failure

// Enum associated values
enum Activity {
    case bored
    case running(destination: String)
    case talking(topic: String)
    case singing(volume: Int)
}

let talking = Activity.talking(topic: "football")

// Enum raw values
enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
}

let earth = Planet(rawValue: 2)

/*:
 ## Summary
 1. Arrays, sets, tuples, and dictionaries let you store a group of items under a single value. They each do this in different ways, so which you use depends on the behavior you want.
 2. Arrays store items in the order you add them, and you access them using numerical positions.
 3. Sets store items without any order, so you can’t access them using numerical positions.
 4. Tuples are fixed in size, and you can attach names to each of their items. You can read items using numerical positions or using your names.
 5. Dictionaries store items according to a key, and you can read items using those keys.
 6. Enums are a way of grouping related values so you can use them without spelling mistakes.
 7. You can attach raw values to enums so they can be created from integers or strings, or you can add associated values to store additional information about each case.
 */

//: [Next](@next)
