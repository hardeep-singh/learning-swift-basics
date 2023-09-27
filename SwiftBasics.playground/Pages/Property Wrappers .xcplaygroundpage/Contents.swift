//: [Previous](@previous)

import Foundation
//: ### * Stored Properties
//: ### * Computed Properties
//: ### * Lazy Stored Properties
//: ### * Property Observers

//: ### * Property wrappers Example

@propertyWrapper
struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

struct User {
    @Capitalized var firstName: String
    @Capitalized var lastName: String
}

var user = User(firstName: "john", lastName: "appleseed")
user.lastName = "sundell"
print(user.firstName)
print(user.lastName)
