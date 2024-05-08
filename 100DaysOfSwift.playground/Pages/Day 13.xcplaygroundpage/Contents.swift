/*:
 [< Previous](@previous)
 # Day 13 – Swift review, day one
 */

import Foundation

// 1. Variables and constants
var name = "Tim McGraw"
name = "Romeo"

// 2. Types of Data
var name: String
name = "Tim McGraw"


var age: Int
age = 25

//name = 25
//age = "Tim McGraw"

// Float and Double
var latitude: Double
latitude = 36.166667

var longtitude: Float
longtitude = -1234586.783333

// Boolean
var stayOutTooLate: Bool
stayOutTooLate = true

var nothingInBrain: Bool
nothingInBrain = true

var missABeat = false

// Using type annotations wisely
var name: String = "Tim McGraw"

let age = 25
let longitude = -86.783333
var nothingInBrain = true

// 3. Operators
var a = 10
a = a + 1
a = a - 1
a = a * a

var b = 10
b += 10
b -= 10

var a = 1.1
var b = 2.2
var c = a + b

var name1 = "Tim McGraw"
var name2 = "Romeo"
var both = name1 + " and " + name2

// Comparison operators
var a = 1.1
var b = 2.2
var c = a + b

c > 3
c >= 3
c > 4
c < 4

var name = "Tim McGraw"
name == "TIM McGraw"
name != "TIM McGraw"

var stayOutTooLate = true
stayOutTooLate
!stayOutTooLate

// 4. String Interpolation
var name = "Tim McGraw"
var age = 25
var latitude = 36.166667

"Your name is \(name), your age is \(age), and your latitude is \(latitude)"

"Your age is \(age) years old. In another \(age) years you will be \(age * 2)"

// 5. Arrays
var evenNumbers = [2, 4, 6, 8]
var songs: [Any] = ["Shake it Off", "You Belong with Me", "Back to December", 3]

songs[0]
songs[1]
songs[2]

type(of: songs)

// Creating arrays
var songs = [String]()
songs[0] = "Shake it Off"

// Array operators
var songs1: [Any] = ["Shake it Off", "You Belong with Me", "Love Story"]
var songs2 = ["Today was a Fairytale", "Welcome to New York", "Fifteen"]

var both = songs1 + songs2
both += ["Everything has Changed"]

print(both)

// 6. Dictionaries
var person = [
    "first": "Taylor",
    "middle": "Alison",
    "last": "Swift",
    "month": "December",
    "website": "taylorswift.com"
]
person["middle"]
person["month"]

// 7. Conditional statements
var action: String
var person = "hater"

if person == "hater" {
    action = "hate"
} else if person == "player" {
    action = "play"
} else {
    action = "cruise"
}

// Evaluating multiple conditions
var action: String
var stayOutTooLate = true
var nothingInBrain = true

if stayOutTooLate && nothingInBrain {
    action = "cruise"
}

// Looking for the opposite of truth
var stayOutTooLate = true
var nothingInBrain = true
var action: String

if !stayOutTooLate && !nothingInBrain {
    action = "cruise"
}

// 8. Loops
for i in 1...10 {
    print("\(i) x 10 is \(i * 10)")
}

var str = "Fakers gonna"

for _ in 1...5 {
    str += " fake"
}

print(str)

1 ..< 5

// Looping over arrays
var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    print("My favorite song is \(song)")
}

var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]

for i in 0..<people.count {
    print("\(people[i]) gonna \(actions[i])")
}

// Inner loops
var people = ["players", "haters", "heart-breakers", "fakers"]
var actions = ["play", "hate", "break", "fake"]


for i in 0..<people.count {
    var str = "\(people[i]) gonna"
    
    for _ in 1...5 {
        str += " \(actions[i])"
    }
    
    print(str)
}

// While loops
var counter = 0

while true {
    print("Counter is now \(counter)")
    
    counter += 1
    
    if counter == 556 {
        break
    }
}

var songs = ["Shake it Off", "You Belong with Me", "Look What You Made Me Do"]

for song in songs {
    if song == "You Belong with Me" {
        continue
    }
    
    print("My favorite song is \(song)")
}

// 9. Switch case
let liveAlbums = 2

switch liveAlbums {
case 0...1:
    print("You're just starting out")

case 2...3:
    print("You're a rising star!")
    
case 4...5:
    print("You're world famous!")
    
default:
    print("Have you done something new?")
}

//: [Next](@next)
