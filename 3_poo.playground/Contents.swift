/*
 Week : 4
 Subject : POO
 Author : Jaime Gomez
 Date : 02/04/2025
 Version : 0.0.1
 */


// import UIKit

// -----------------------------
//    POO
//   https://docs.swift.org/swift-book/documentation/the-swift-programming-language/enumerations

// -----------------------------

// Lesson 3.1: Classes and Structures (30 minutes)

// Properties and Methods


class Vehicle {
    // Stored properties
    var brand: String
    var model: String
    var currentSpeed: Double = 0.0
    
    // Computed property
    var description: String {
        return "\(brand) \(model)"
    }
    
    // Method
    func accelerate(by speed: Double) {
        currentSpeed += speed
    }
    
    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }
}

// Value Types vs. Reference Types

// Struct (Value Type)
struct Point {
    var x: Double
    var y: Double
}

// Class (Reference Type)
class Location {
    var coordinate: Point
    
    init(x: Double, y: Double) {
        self.coordinate = Point(x: x, y: y)
    }
}

// Demonstration of value type behavior
var point1 = Point(x: 10, y: 20)
var point2 = point1  // Creates a complete copy
point2.x = 30  // Does not affect point1

// Demonstration of reference type behavior
var location1 = Location(x: 10, y: 20)
var location2 = location1  // Creates a reference
location2.coordinate.x = 30  // Affects both location1 and location2

 /*

Key Differences

    Structs (Value Types):

    - Copied when assigned
    - Immutable by default
    - Cannot inherit from other structs
    - Better for simple data holding

    Classes (Reference Types):

    - Passed by reference
    - Allow inheritance
    - Can have deinitializers
    - Support complex object relationships

// */


// Lesson 3.2: Initialization and Deinitialization (25 minutes)


import Foundation

// Designated and Convenience Initializers

class BankAccount {
    var accountNumber: String
    var balance: Double
    var owner: String
    
    // Designated initializer
    init(accountNumber: String, owner: String, initialBalance: Double = 0.0) {
        self.accountNumber = accountNumber
        self.owner = owner
        self.balance = initialBalance
    }
    
    // Convenience initializer
    convenience init(owner: String) {
        let randomAccountNumber = UUID().uuidString
        self.init(accountNumber: randomAccountNumber, owner: owner)
    }
}


// Initializer Inheritance

class SuperAccount: BankAccount {
    var accountType: String
    
    // Designated initializer for subclass
    init(accountNumber: String, owner: String, accountType: String, initialBalance: Double = 0.0) {
        self.accountType = accountType
        super.init(accountNumber: accountNumber, owner: owner, initialBalance: initialBalance)
    }
    
    // Convenience initializer
    convenience init(owner: String, accountType: String) {
        let randomAccountNumber = UUID().uuidString
        self.init(accountNumber: randomAccountNumber, owner: owner, accountType: accountType)
    }
}

// Deinitialization

class ResourceManager {
    var resourceID: Int
    
    init(resourceID: Int) {
        self.resourceID = resourceID
        print("Resource \(resourceID) initialized")
    }
    
    deinit {
        print("Cleaning up resource \(resourceID)")
    }
}

// Demonstration
func demonstrateDeinitialization() {
    let resource = ResourceManager(resourceID: 42)
    // Resource will be deinitialized when it goes out of scope
}

demonstrateDeinitialization()

// Lesson 3.3: Inheritance and Polymorphism (25 minutes)

// Subclasses and Superclasses

class Shape {
    var color: String
    
    init(color: String) {
        self.color = color
    }
    
    func area() -> Double {
        return 0.0  // Base implementation
    }
}

class Circle: Shape {
    var radius: Double
    
    init(color: String, radius: Double) {
        self.radius = radius
        super.init(color: color)
    }
    
    override func area() -> Double {
        return Double.pi * radius * radius
    }
}

class Rectangle: Shape {
    var width: Double
    var height: Double
    
    init(color: String, width: Double, height: Double) {
        self.width = width
        self.height = height
        super.init(color: color)
    }
    
    override func area() -> Double {
        return width * height
    }
}

// Method and Property Overriding

class Animal {
    func makeSound() {
        print("Some generic sound")
    }
}

class Dog: Animal {
    override func makeSound() {
        print("Woof! Woof!")
    }
}

// Polymorphic behavior
let animals: [Animal] = [Animal(), Dog()]
animals.forEach { $0.makeSound() }


// Type Casting

func describeShape(_ shape: Shape) {
    print("Color: \(shape.color)")
    print("Area: \(shape.area())")
    
    // Type checking and casting
    if let circle = shape as? Circle {
        print("Radius: \(circle.radius)")
    } else if let rectangle = shape as? Rectangle {
        print("Width: \(rectangle.width), Height: \(rectangle.height)")
    }
}



// Lesson 3.4: Advanced Properties and Methods (40 minutes)

// Computed Properties
struct Temperature {
    var celsius: Double
    
    var fahrenheit: Double {
        get {
            return (celsius * 9/5) + 32
        }
        set {
            celsius = (newValue - 32) * 5/9
        }
    }
}

// Property Observers
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}


// Interfaces
protocol Volador {
    func volar()
}

class Pajaro {
    var nombre: String
    
    init(nombre: String) {
        self.nombre = nombre
    }
}

extension Pajaro: Volador {
    func volar() {
        print("\(nombre) está volando")
    }
}

class Avion: Volador {
    func volar() {
        print("El avión está volando a gran altura")
    }
}

// Ambos pueden volar, aunque son tipos completamente diferentes
let pajaro = Pajaro(nombre: "Gorrión")
let avion = Avion()

pajaro.volar()
avion.volar()
