/*:
 [< Previous](@previous)
 # Day 6 – closures part one
 */

import Foundation

// Creating basic closures
let driving = {
    print("I'm driving in my car")
}

driving()

// Accepting parameters in a closure
let driving2 = { (place: String) in
    print("I'm going to \(place) in my car")
}

driving2("London")

// Returning values from a closure
let driving3 = { (place: String) in
    print("I'm going to \(place) in my car")
}

let drivingWithReturn = { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

let message = drivingWithReturn("London")
print(message)

// Closures as parameters
let driving4 = {
    print("I'm driving in my car")
}

func travel(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel(action: driving4)

// Trailing closure syntax
func travel2(action: () -> Void) {
    print("I'm getting ready to go.")
    action()
    print("I arrived!")
}

travel2 {
    print("I'm driving in my car")
}

// Using closures as parameters when they accept parameters
func travel(action: (String) -> Void) {
    print("I'm getting ready to go.")
    action("London")
    print("I arrived!")
}

travel { (place: String) in
    print("I'm going to \(place) in my car")
}

// Using closures as parameters when they return values
func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel { (place: String) -> String in
    return "I'm going to \(place) in my car"
}

// Shorthand parameter names
func travel2(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}

travel2 {
    "I'm going to \($0) in my car"
}

// Closures with multiple parameters
func travel(action: (String, Int) -> String) {
    print("I'm getting ready to go.")
    let description = action("London", 60)
    print(description)
    print("I arrived!")
}

travel {
    "I'm going to \($0) at \($1) miles per hour."
}

// Returning closures from functions
func travel() -> (String) -> Void {
    return {
        print("I'm going to \($0)")
    }
}

let result = travel()
result("London")

let result2 = travel()("London")

// Capturing values
func travel2() -> (String) -> Void {
    var counter = 1
    return {
        print("\(counter). I'm going to \($0)")
        counter += 1
    }
}

let result3 = travel2()
result3("London")
result3("London")
result3("London")

/*:
 ## Summary
 1. You can assign closures to variables, then call them later on.
 2. Closures can accept parameters and return values, like regular functions.
 3. You can pass closures into functions as parameters, and those closures can have parameters of their own and a return value.
 4. If the last parameter to your function is a closure, you can use trailing closure syntax.
 5. Swift automatically provides shorthand parameter names like $0 and $1, but not everyone uses them.
 6. If you use external values inside your closures, they will be captured so the closure can refer to them later.
 */

//: [Next](@next)
