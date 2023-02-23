//
//  CareerModel.swift
//  CricFreak
//
//  Created by Admin on 23/2/23.
//

import Foundation

// MARK: - Welcome
struct CareerModel: Codable {
    var data: CareerData?
}

// MARK: - DataClass
struct CareerData: Codable {
    var resource: String?
    var id, countryID: Int?
    var firstname, lastname, fullname: String?
    var imagePath: String?
    var dateofbirth, gender, battingstyle, bowlingstyle: String?
    var position: Position?
    var country: Country?
    var updatedAt: String?
    var career: [Career]?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case firstname, lastname, fullname
        case imagePath = "image_path"
        case dateofbirth, gender, battingstyle, bowlingstyle, position, country
        case updatedAt = "updated_at"
        case career
    }
}

// MARK: - Career
struct Career: Codable {
    var resource: CareerResource?
    var type: String?
    var seasonID, playerID: Int?
    var bowling, batting: [String: Double]?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, type
        case seasonID = "season_id"
        case playerID = "player_id"
        case bowling, batting
        case updatedAt = "updated_at"
    }
}

enum CareerResource: String, Codable {
    case careers = "careers"
}

// MARK: - Country
struct Country: Codable {
    var resource: String?
    var id, continentID: Int?
    var name: String?
    var imagePath: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case continentID = "continent_id"
        case name
        case imagePath = "image_path"
        case updatedAt = "updated_at"
    }
}

// MARK: - Position
struct Position: Codable {
    var resource: String?
    var id: Int?
    var name: String?
}

