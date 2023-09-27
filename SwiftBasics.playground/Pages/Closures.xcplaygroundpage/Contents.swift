//: [Previous](@previous)

import Foundation


let reversedNames = ["a", "z", "b"].sorted() { $0 > $1 }
print(reversedNames)

//: #### Capturing Values
var a = 10
var b = 20

var clouser = { [a] in
    print("a:- \(a)")
    print("b:- \(b)")
}

a = 1
b = 2
clouser() // Output:- a:- 10 b:- 2


//: #### Closures Are Reference Types
//: #### Escaping and Non-Escaping Closures

//: #### Trailing Closures

func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}

// Here's how you call this function without using a trailing closure:
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

// Here's how you call this function with a trailing closure instead:
someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

//: #### Autoclosures
//: An autoclosure is a closure that’s automatically created to wrap an expression that’s being passed as an argument to a function. It doesn’t take any arguments,
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}
serve(customer: "String"); // Outpur:- Now serving String!
