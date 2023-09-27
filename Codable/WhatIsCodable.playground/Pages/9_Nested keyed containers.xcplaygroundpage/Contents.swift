
import Foundation

struct Toy: Codable {
  var name: String
}

struct Employee: Encodable {
  var name: String
  var id: Int
  var favoriteToy: Toy
    
  enum CodingKeys: CodingKey {
    case nameKey, idKey, giftKey
  }
    
  enum GiftKeys: CodingKey {
    case toyKey
  }
    
  func encode(to encoder: Encoder) throws {
      // Container by key...
    var container = encoder.container(keyedBy: CodingKeys.self)
    try container.encode(name, forKey: CodingKeys.nameKey)
    try container.encode(id, forKey: CodingKeys.idKey)
      
      // Nested container by key...
    var giftContainer = container.nestedContainer(keyedBy: GiftKeys.self, forKey: CodingKeys.giftKey)
    try giftContainer.encode(favoriteToy, forKey: GiftKeys.toyKey)
  }
}

let toy = Toy(name: "Teddy Bear")
let employee = Employee(name: "John Appleseed", id: 7, favoriteToy: toy)

let encoder = JSONEncoder()
let decoder = JSONDecoder()

let nestedData = try encoder.encode(employee)
let nestedString = String(data: nestedData, encoding: .utf8)!

extension Employee: Decodable {
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decode(String.self, forKey: .nameKey)
    id = try container.decode(Int.self, forKey: .idKey)
    let giftContainer =  try container.nestedContainer(keyedBy: GiftKeys.self, forKey: .giftKey)
    favoriteToy = try giftContainer.decode(Toy.self, forKey: GiftKeys.toyKey)
  }
}

let sameEmployee = try decoder.decode(Employee.self, from: nestedData)
