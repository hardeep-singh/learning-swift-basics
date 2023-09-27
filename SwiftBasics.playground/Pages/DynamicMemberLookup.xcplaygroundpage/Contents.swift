//: [Previous](@previous)

import Foundation

/*: # Dynamic member lookup
    Dynamic member lookup is a feature in Swift that allows you to access properties or subscripts of a type using a dynamic syntax. It's particularly useful when working with dynamic data structures, such as JSON or dictionaries, where the structure is not known at compile time.
 */

@dynamicMemberLookup
struct DynamicStruct {
    // This is the underlying data structure (e.g., a dictionary)
    private var data: [String: Any]
    init(data: [String: Any]) {
        self.data = data
    }
    
    // Implement dynamic member subscripting
    subscript(dynamicMember key: String) -> Any? {
        return data[key]
    }
}

let jsonData: [String: Any] = ["name": "John", "age": 30, "city": "New York"]
let dynamicInstance = DynamicStruct(data: jsonData)

// Access properties dynamically using dot notation
let name = dynamicInstance.name // "John"
let age = dynamicInstance.age   // 30
let city = dynamicInstance.city // "New York"

print(name)
print(age)
print(city)

//: [Next](@next)
