//: [Previous](@previous)

import Foundation


//: ## * Opaque and Boxed Types
protocol Shape {
    func draw() -> String
}

protocol ShapeSize {
    associatedtype Value
    var value: Value {get set}
}

struct Triangle: Shape, ShapeSize {
    typealias Value = String
    var value: Value = "20.0"
    func draw() -> String {
        return "Triangle"
    }
}
struct Square: Shape, ShapeSize {
    typealias Value = Double
    var value: Value = 10.00
    func draw() -> String {
        return "Square"
    }
}

// This method will work fine, because we Protocol does not hold Self and associated value...
func createAnyShapeType_V1(showSquare: Bool) -> Shape {
    if showSquare {
        return Square()
    }
    return Triangle()
}

// Error: use of protocol 'ShapeSize' as a type must be written 'any ShapeSize'
// I solved with Opaque type..... because there return type is single.
func createAnyShapeType_V2(showSquare: Bool) -> some ShapeSize {
    return Triangle()
}

//:
//: #### Boxed Protocol Types
// Error: Function declares an opaque return type 'some ShapeSize', but the return statements in its body do not have matching underlying types
// You need to use 'any' keyword to solve this problem. replace 'some' with 'any'
func createAnyShapeType_V3(showSquare: Bool) -> any ShapeSize {
    if showSquare {
        return Square()
    }
    return Triangle()
}

let shapeSize: any ShapeSize = createAnyShapeType_V3(showSquare: true);
print("ITS WORKING>>>>> \(shapeSize.value)")
