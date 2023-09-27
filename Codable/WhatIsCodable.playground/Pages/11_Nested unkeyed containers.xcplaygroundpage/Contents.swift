import Foundation

let encoder = JSONEncoder()
let decoder = JSONDecoder()

struct Toy: Encodable {
  var name: String
  var label: String
  
  enum CodingKeys: CodingKey {
    case nameKey, labelKey
  }
  
  func encode(to encoder: Encoder) throws {
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: CodingKeys.nameKey)
    var labelContainer = container.nestedUnkeyedContainer(forKey: CodingKeys.labelKey)
    try labelContainer.encode(label.lowercased())
    try labelContainer.encode(label.uppercased())
    try labelContainer.encode(label)
  }
}

let toy = Toy(name: "Teddy Bear", label: "Teddy Bear")
let data = try encoder.encode(toy)
let string = String(data: data, encoding: .utf8)!

extension Toy: Decodable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: CodingKeys.nameKey)
        var labelContainer = try container.nestedUnkeyedContainer(forKey: CodingKeys.labelKey)
        var labelName = ""
        while !labelContainer.isAtEnd {
            labelName = try labelContainer.decode(String.self)
        }
        label = labelName
    }
}

let sameToy = try decoder.decode(Toy.self, from: data)
