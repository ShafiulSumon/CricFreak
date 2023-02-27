//
//  RankingModel.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import Foundation

// MARK: - Welcome
struct RankingModel: Codable {
    var data: [RankingData]?
}

// MARK: - Datum
struct RankingData: Codable {
    var resource, type: String?
    var position, points, rating: String?
    var gender, updatedAt: String?
    var team: [Team4]?

    enum CodingKeys: String, CodingKey {
        case resource, type, position, points, rating, gender
        case updatedAt = "updated_at"
        case team
    }
}

// MARK: - Team
struct Team4: Codable {
    var resource: RankResource?
    var id: Int?
    var name, code: String?
    var imagePath: String?
    var countryID: Int?
    var nationalTeam: Bool?
    var position: Int?
    var updatedAt: String?
    var ranking: Ranking?

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case imagePath = "image_path"
        case countryID = "country_id"
        case nationalTeam = "national_team"
        case position
        case updatedAt = "updated_at"
        case ranking
    }
}

// MARK: - Ranking
struct Ranking: Codable {
    var position, matches, points, rating: Int?
}

enum RankResource: String, Codable {
    case teams = "teams"
}
