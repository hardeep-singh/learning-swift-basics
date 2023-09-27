
import Foundation

struct Toy: Codable {
  var name: String
}

let toy = Toy(name: "Teddy Bear")

let encoder = JSONEncoder()
let decoder = JSONDecoder()

struct Label: Encodable {
  var toy: Toy
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.unkeyedContainer()
    try container.encode(toy.name.lowercased())
    try container.encode(toy.name.uppercased())
    try container.encode(toy.name)
  }
}

let label = Label(toy: toy)
let labelData = try encoder.encode(label)
let labelString = String(data: labelData, encoding: .utf8)!

extension Label: Decodable {
  init(from decoder: Decoder) throws {
    var container = try decoder.unkeyedContainer()
    var name = ""
    while !container.isAtEnd {
      name = try container.decode(String.self)
    }
    toy = Toy(name: name)
  }
}

let sameLabel = try decoder.decode(Label.self, from: labelData)






















