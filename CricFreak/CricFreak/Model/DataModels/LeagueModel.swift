//
//  LeagueModel.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

// MARK: - Welcome
struct LeagueModel: Codable {
    var data: [LeagueData]?
}

// MARK: - Datum
struct LeagueData: Codable {
    var resource: String?
    var id, seasonID, countryID: Int?
    var name, code: String?
    var imagePath: String?
    var type, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case seasonID = "season_id"
        case countryID = "country_id"
        case name, code
        case imagePath = "image_path"
        case type
        case updatedAt = "updated_at"
    }
}
