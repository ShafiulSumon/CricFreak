//
//  RecentModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

//// MARK: - Welcome
//struct RecentModel: Codable {
//    let data: [RecentData]?
//    let links: Links?
//    let meta: Meta?
//}
//
//// MARK: - Datum
//struct RecentData: Codable {
//    let resource: DatumResource?
//    let id, leagueID: Int?
//    let round, startingAt: String?
//    let status: Status?
//    let note: String?
//    let weatherReport: [JSONAny]?
//    let localteam, visitorteam: Team?
//    let runs: [Run?]?
//    let venue: Venue?
//    let stage: Stage?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case leagueID = "league_id"
//        case round
//        case startingAt = "starting_at"
//        case status, note
//        case weatherReport = "weather_report"
//        case localteam, visitorteam, runs, venue, stage
//    }
//}
//
//// MARK: - Team
//struct Team: Codable {
//    let resource: LocalteamResource?
//    let id: Int?
//    let name, code: String?
//    let imagePath: String?
//    let updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, name, code
//        case imagePath = "image_path"
//        case updatedAt = "updated_at"
//    }
//}
//
//enum LocalteamResource: String, Codable {
//    case teams = "teams"
//}
//
//enum DatumResource: String, Codable {
//    case fixtures = "fixtures"
//}
//
//// MARK: - Run
//struct Run: Codable {
//    let resource: RunResource?
//    let id, fixtureID, teamID, inning: Int?
//    let score, wickets: Int?
//    let overs: Double?
//    let pp1: Pp1?
//    let pp2: String?
//    let pp3: JSONNull?
//    let updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case fixtureID = "fixture_id"
//        case teamID = "team_id"
//        case inning, score, wickets, overs, pp1, pp2, pp3
//        case updatedAt = "updated_at"
//    }
//}
//
//enum Pp1: String, Codable {
//    case the14 = "1-4"
//    case the16 = "1-6"
//}
//
//enum RunResource: String, Codable {
//    case runs = "runs"
//}
//
//// MARK: - Stage
//struct Stage: Codable {
//    let resource: StageResource?
//    let id: Int?
//    let name: Name?
//    let updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, name
//        case updatedAt = "updated_at"
//    }
//}
//
//enum Name: String, Codable {
//    case irelandTourOfZimbabwe = "Ireland tour of Zimbabwe"
//    case newZealandTourOfIndia = "New Zealand tour of India"
//    case playOffs = "Play Offs"
//    case regularSeason = "Regular Season"
//}
//
//enum StageResource: String, Codable {
//    case stages = "stages"
//}
//
//enum UpdatedAt: String, Codable {
//    case the20220708T201538000000Z = "2022-07-08T20:15:38.000000Z"
//    case the20220708T201551000000Z = "2022-07-08T20:15:51.000000Z"
//    case the20221211T101956000000Z = "2022-12-11T10:19:56.000000Z"
//    case the20221211T102712000000Z = "2022-12-11T10:27:12.000000Z"
//}
//
//enum Status: String, Codable {
//    case finished = "Finished"
//    case ns = "NS"
//}
//
//// MARK: - Venue
//struct Venue: Codable {
//    let resource: VenueResource?
//    let id, countryID: Int?
//    let name, city: String?
//    let imagePath: String?
//    let capacity: Int?
//    let floodlight: Bool?
//    let updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case countryID = "country_id"
//        case name, city
//        case imagePath = "image_path"
//        case capacity, floodlight
//        case updatedAt = "updated_at"
//    }
//}
//
//enum VenueResource: String, Codable {
//    case venues = "venues"
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let first, last: String?
//    let prev, next: JSONNull?
//}
//
//// MARK: - Meta
//struct Meta: Codable {
//    let currentPage, from, lastPage: Int?
//    let links: [Link]?
//    let path: String?
//    let perPage, to, total: Int?
//
//    enum CodingKeys: String, CodingKey {
//        case currentPage = "current_page"
//        case from
//        case lastPage = "last_page"
//        case links, path
//        case perPage = "per_page"
//        case to, total
//    }
//}
//
//// MARK: - Link
//struct Link: Codable {
//    let url: String?
//    let label: String?
//    let active: Bool?
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
//    public func hash(into hasher: inout Hasher) {
//        // No-op
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


// MARK: - Welcome
struct RecentModel: Codable {
    let data: [RecentData]?
}

// MARK: - Datum
struct RecentData: Codable {
    let resource: String?
    let id, leagueID: Int?
    let round, startingAt: String?
    let status: String?
    let note: String?
    let localteam, visitorteam: Team?
    let runs: [Run]?
    let venue: Venue?
    let stage: Stage?

    enum CodingKeys: String, CodingKey {
        case resource = "fixtures"
        case id
        case leagueID = "league_id"
        case round
        case startingAt = "starting_at"
        case status, note
        case localteam, visitorteam, runs, venue, stage
    }
}

// MARK: - Team
struct Team: Codable {
    let resource: String?
    let id: Int?
    let name, code: String?
    let imagePath: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource = "teams"
        case id, name, code
        case imagePath = "image_path"
        case updatedAt = "updated_at"
    }
}


// MARK: - Run
struct Run: Codable {
    let resource: String?
    let id, fixtureID, teamID, inning: Int?
    let score, wickets: Int?
    let overs: Double?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource = "runs"
        case id
        case fixtureID = "fixture_id"
        case teamID = "team_id"
        case inning, score, wickets, overs
        case updatedAt = "updated_at"
    }
}

// MARK: - Stage
struct Stage: Codable {
    let resource: String?
    let id: Int?
    let name: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource = "stages"
        case id, name
        case updatedAt = "updated_at"
    }
}

// MARK: - Venue
struct Venue: Codable {
    let resource: VenueResource?
    let id, countryID: Int?
    let name, city: String?
    let imagePath: String?
    let capacity: Int?
    let floodlight: Bool?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case name, city
        case imagePath = "image_path"
        case capacity, floodlight
        case updatedAt = "updated_at"
    }
}

enum VenueResource: String, Codable {
    case venues = "venues"
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}
