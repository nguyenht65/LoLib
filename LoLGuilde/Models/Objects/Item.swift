
import Foundation

struct ItemBase : Codable {
    let data : [String: Item]
}

struct Item : Codable {
    let name : String
    let description : String
    let plaintext : String
    let into : [String]?
    let from : [String]?
    let image : Image
    let gold : Gold
    let tags : [String]
    let stats : Stats

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case plaintext = "plaintext"
        case into = "into"
        case from = "from"
        case image = "image"
        case gold = "gold"
        case tags = "tags"
        case stats = "stats"
    }
}


//import Foundation
//
//// MARK: - Item
//struct Base: Codable {
//    let type: TypeEnum
//    let version: String
//    let data: [String: Item]
//    let groups: [Group]
//    let tree: [Tree]
//}
//
//// MARK: - Gold
//struct Gold: Codable {
//    let base, total, sell: Int
//    let purchasable: Bool
//}
//
//// MARK: - Rune
//struct Rune: Codable {
//    let isrune: Bool
//    let tier: Int
//    let type: String
//}
//
//// MARK: - Datum
//struct Item: Codable {
//    let name, datumDescription, colloq, plaintext: String
//    let into: [String]?
//    let image: Image
//    let gold: Gold
//    let tags: [String]
//    let maps: [String: Bool]
//    let stats: [String: Double]
//    let inStore: Bool?
//    let from: [String]?
//    let effect: Effect?
//    let depth, stacks: Int?
//    let consumed, hideFromAll, consumeOnFull: Bool?
//    let requiredChampion: String?
//    let specialRecipe: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case name
//        case datumDescription = "description"
//        case colloq, plaintext, into, image, gold, tags, maps, stats, inStore, from, effect, depth, stacks, consumed, hideFromAll, consumeOnFull, requiredChampion, specialRecipe
//    }
//}
//
//// MARK: - Effect
//struct Effect: Codable {
//    let effect1Amount: String
//    let effect2Amount, effect3Amount, effect4Amount, effect5Amount: String?
//    let effect6Amount, effect7Amount, effect8Amount, effect9Amount: String?
//    let effect10Amount, effect11Amount, effect12Amount, effect13Amount: String?
//    let effect14Amount, effect15Amount, effect16Amount, effect17Amount: String?
//    let effect18Amount: String?
//
//    enum CodingKeys: String, CodingKey {
//        case effect1Amount = "Effect1Amount"
//        case effect2Amount = "Effect2Amount"
//        case effect3Amount = "Effect3Amount"
//        case effect4Amount = "Effect4Amount"
//        case effect5Amount = "Effect5Amount"
//        case effect6Amount = "Effect6Amount"
//        case effect7Amount = "Effect7Amount"
//        case effect8Amount = "Effect8Amount"
//        case effect9Amount = "Effect9Amount"
//        case effect10Amount = "Effect10Amount"
//        case effect11Amount = "Effect11Amount"
//        case effect12Amount = "Effect12Amount"
//        case effect13Amount = "Effect13Amount"
//        case effect14Amount = "Effect14Amount"
//        case effect15Amount = "Effect15Amount"
//        case effect16Amount = "Effect16Amount"
//        case effect17Amount = "Effect17Amount"
//        case effect18Amount = "Effect18Amount"
//    }
//}
//
//// MARK: - Image
//struct Image: Codable {
//    let full: String
//    let sprite: Sprite
//    let group: TypeEnum
//    let x, y, w, h: Int
//}
//
//enum TypeEnum: String, Codable {
//    case item = "item"
//}
//
//enum Sprite: String, Codable {
//    case item0PNG = "item0.png"
//    case item1PNG = "item1.png"
//}
//
//// MARK: - Group
//struct Group: Codable {
//    let id, maxGroupOwnable: String
//
//    enum CodingKeys: String, CodingKey {
//        case id
//        case maxGroupOwnable = "MaxGroupOwnable"
//    }
//}
//
//// MARK: - Tree
//struct Tree: Codable {
//    let header: String
//    let tags: [String]
//}
//
//// MARK: - Encode/decode helpers
//
//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}
//
//class JSONCodingKey: CodingKey {
//    let key: String
//
//    required init?(intValue: Int) {
//        return nil
//    }
//
//    required init?(stringValue: String) {
//        key = stringValue
//    }
//
//    var intValue: Int? {
//        return nil
//    }
//
//    var stringValue: String {
//        return key
//    }
//}
//
//class JSONAny: Codable {
//
//    let value: Any
//
//    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
//        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
//        return DecodingError.typeMismatch(JSONAny.self, context)
//    }
//
//    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
//        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
//        return EncodingError.invalidValue(value, context)
//    }
//
//    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if container.decodeNil() {
//            return JSONNull()
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
//        if let value = try? container.decode(Bool.self) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self) {
//            return value
//        }
//        if let value = try? container.decode(Double.self) {
//            return value
//        }
//        if let value = try? container.decode(String.self) {
//            return value
//        }
//        if let value = try? container.decodeNil() {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer() {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
//        if let value = try? container.decode(Bool.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Int64.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(Double.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decode(String.self, forKey: key) {
//            return value
//        }
//        if let value = try? container.decodeNil(forKey: key) {
//            if value {
//                return JSONNull()
//            }
//        }
//        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
//            return try decodeArray(from: &container)
//        }
//        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
//            return try decodeDictionary(from: &container)
//        }
//        throw decodingError(forCodingPath: container.codingPath)
//    }
//
//    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
//        var arr: [Any] = []
//        while !container.isAtEnd {
//            let value = try decode(from: &container)
//            arr.append(value)
//        }
//        return arr
//    }
//
//    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
//        var dict = [String: Any]()
//        for key in container.allKeys {
//            let value = try decode(from: &container, forKey: key)
//            dict[key.stringValue] = value
//        }
//        return dict
//    }
//
//    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
//        for value in array {
//            if let value = value as? Bool {
//                try container.encode(value)
//            } else if let value = value as? Int64 {
//                try container.encode(value)
//            } else if let value = value as? Double {
//                try container.encode(value)
//            } else if let value = value as? String {
//                try container.encode(value)
//            } else if value is JSONNull {
//                try container.encodeNil()
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer()
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
//        for (key, value) in dictionary {
//            let key = JSONCodingKey(stringValue: key)!
//            if let value = value as? Bool {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Int64 {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? Double {
//                try container.encode(value, forKey: key)
//            } else if let value = value as? String {
//                try container.encode(value, forKey: key)
//            } else if value is JSONNull {
//                try container.encodeNil(forKey: key)
//            } else if let value = value as? [Any] {
//                var container = container.nestedUnkeyedContainer(forKey: key)
//                try encode(to: &container, array: value)
//            } else if let value = value as? [String: Any] {
//                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
//                try encode(to: &container, dictionary: value)
//            } else {
//                throw encodingError(forValue: value, codingPath: container.codingPath)
//            }
//        }
//    }
//
//    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
//        if let value = value as? Bool {
//            try container.encode(value)
//        } else if let value = value as? Int64 {
//            try container.encode(value)
//        } else if let value = value as? Double {
//            try container.encode(value)
//        } else if let value = value as? String {
//            try container.encode(value)
//        } else if value is JSONNull {
//            try container.encodeNil()
//        } else {
//            throw encodingError(forValue: value, codingPath: container.codingPath)
//        }
//    }
//
//    public required init(from decoder: Decoder) throws {
//        if var arrayContainer = try? decoder.unkeyedContainer() {
//            self.value = try JSONAny.decodeArray(from: &arrayContainer)
//        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
//            self.value = try JSONAny.decodeDictionary(from: &container)
//        } else {
//            let container = try decoder.singleValueContainer()
//            self.value = try JSONAny.decode(from: container)
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        if let arr = self.value as? [Any] {
//            var container = encoder.unkeyedContainer()
//            try JSONAny.encode(to: &container, array: arr)
//        } else if let dict = self.value as? [String: Any] {
//            var container = encoder.container(keyedBy: JSONCodingKey.self)
//            try JSONAny.encode(to: &container, dictionary: dict)
//        } else {
//            var container = encoder.singleValueContainer()
//            try JSONAny.encode(to: &container, value: self.value)
//        }
//    }
//}
