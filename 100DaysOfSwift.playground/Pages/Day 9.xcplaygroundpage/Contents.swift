/*:
 [< Previous](@previous)
 # Day 9 – access control, static properties, and laziness
 */

import Foundation

// Initializers
struct User {
    var username: String
    
    init() {
        username = "Anonymous"
        print("Creating a new user!")
    }
}

var user = User()
user.username = "twostraws"

// Referring to the current instance
struct Person {
    var name: String
    
    init(name: String) {
        print("\(name) was born!")
        self.name = name
    }
}

// Lazy properties
struct FamilyTree {
    init() {
        print("Creating family tree!")
    }
}

struct Person2 {
    var name: String
    lazy var familyTree = FamilyTree()
    
    init(name: String) {
        self.name = name
    }
}

var ed = Person2(name: "Ed")
ed.familyTree

// Static properties and methods
struct Student {
    static var classSize = 0
    var name: String
    
    init(name: String) {
        self.name = name
        Student.classSize += 1
    }
}

let ed2 = Student(name: "Ed")
let taylor = Student(name: "Taylor")
print(Student.classSize)

// Access control
struct Person3 {
    private var id: String
    
    init(id: String) {
        self.id = id
    }
    
    func identify() -> String {
        return "My social security number is \(id)"
    }
}

let ed3 = Person3(id: "12345")

/*:
 ## Summary
 1. You can create your own types using structures, which can have their own properties and methods.
 2. You can use stored properties or use computed properties to calculate values on the fly.
 3. If you want to change a property inside a method, you must mark it as mutating.
 4. Initializers are special methods that create structs. You get a memberwise initializer by default, but if you create your own you must give all properties a value.
 5. Use the self constant to refer to the current instance of a struct inside a method.
 6. The lazy keyword tells Swift to create properties only when they are first used.
 7. You can share properties and methods across all instances of a struct using the static keyword.
 8. Access control lets you restrict what code can use properties and methods.
 */

//: [Next](@next)
