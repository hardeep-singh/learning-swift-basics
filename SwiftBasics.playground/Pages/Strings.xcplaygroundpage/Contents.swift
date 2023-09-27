//: [Previous](@previous)

import Foundation

/*: ## String
 - Initialize
 - Multiline
 - Raw String
 */

let object: String = "String Value"
let object2 = "String Value"

let object3 = """
mulitline string
 created..
"""
print(object3)


var intValue: Int = 10
let rawStringCreated = #"My name is "Hardeep Singh" Value: \#(intValue)"#
print(rawStringCreated)


