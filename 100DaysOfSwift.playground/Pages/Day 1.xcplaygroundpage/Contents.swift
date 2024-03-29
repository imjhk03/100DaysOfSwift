/*:
 [< Previous](@previous)
 # Day 1 - variables, simple data types, and string interpolation
 */

import UIKit

// Variables
var greeting = "Hello, playground"
greeting = "Goodbye"

// Strings and Integers
var age = 38
var population = 8_000_000

// Multi-line Strings
var str1 = """
This goes
over multiple
lines
"""

var str2 = """
This goes \
over multiple \
lines
"""

// Doubles and Booleans
var pi = 3.141
var awesome = true

// String interpolation
var score = 85
var str = "Your score was \(score)"
var results = "The test results are here: \(str)"

// Constants
let taylor = "swift"

// Type annotations
let str4 = "Hello, playground"
let album: String = "Reputation"
let year: Int = 1989
let height: Double = 1.78
let taylorRocks: Bool = true

/*:
 ## Summary
 1. You make variables using var and constants using let. It’s preferable to use constants as often as possible.
 2. Strings start and end with double quotes, but if you want them to run across multiple lines you should use three sets of double quotes.
 3. Integers hold whole numbers, doubles hold fractional numbers, and booleans hold true or false.
 4. String interpolation allows you to create strings from other variables and constants, placing their values inside your string.
 5. Swift uses type inference to assign each variable or constant a type, but you can provide explicit types if you want.
 */

//: [Next](@next)
