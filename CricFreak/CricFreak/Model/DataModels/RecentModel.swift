//
//  RecentModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

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
