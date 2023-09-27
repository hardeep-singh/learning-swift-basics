


//: # What is Result Builder

import Foundation

@resultBuilder
struct StringAppendBuilder {
    
    static func buildBlock(_ components: [String]...) -> [String] {
        components.flatMap { $0 }
    }
    
//    static func buildBlock(_ components: String...) -> [String] {
//        components.compactMap { $0 }
//    }
    
//    static func buildPartialBlock(first: [String]) -> [String] {
//        first
//    }
//    
//    static func buildPartialBlock(accumulated: [String], next: [String]) -> [String] {
//        [accumulated, next].flatMap { $0 }
//    }
    
    /// Add support for loops.
    static func buildArray(_ components: [[String]]...) -> [String] {
        components.flatMap { $0.flatMap { $0 } }
    }
        
    /// Add support for optionals.
    static func buildOptional(_ component: [String]?) -> [String] {
        component ?? []
    }
    
    // Create list
    static func buildExpression(_ expression: String) -> [String] {
        [expression]
    }
    
    static func buildExpression(_ expression: [String]) -> [String] {
        expression
    }
    
    /// Add support for if statements.
    static func buildEither(first component: [String]) -> [String] {
        component
    }
    
    static func buildEither(second component: [String]) -> [String] {
        component
    }
    
}

var stringtest: String? = nil
var listOfString = ["String 5", "String 6"]
var isTrue = true



// EXAMPLE with computed property

@StringAppendBuilder var stringList: [String] {
    "String 1"
    ["String 2 ", "String 3"]
    if let value = stringtest {
        value
    }
    "String 4"
    for str in listOfString {
        str
    }
    if isTrue {
        "True String 7.1"
    } else {
        "False String 7.2"
    }
}
print(stringList)


//: EXAMPLE with FUNCTION as parameter
extension String {
    static func makeStringList( @StringAppendBuilder callback: () -> [String]) -> [String] {
        return callback()
    }
}

let list = String.makeStringList {
    "String 1"
    ["String 2 ", "String 3"]
    if let value = stringtest {
        value
    }
    "String 4"
    for str in listOfString {
        str
    }
    if isTrue {
        "True String 7.1"
    } else {
        "False String 7.2"
    }
}

print(list)
