//
//  FixtureModel.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import Foundation

// MARK: - Welcome
struct FixtureModel: Codable {
    var data: [FixtureData]?
}

// MARK: - Datum
struct FixtureData: Codable {
    var resource: String?
    var id, leagueID: Int?
    var round, startingAt, status, note: String?
    var league: League?
    var localteam, visitorteam: Team3?
    var runs: [Run2]?
    var venue: Venue2?
    var stage: Stage2?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case leagueID = "league_id"
        case round
        case startingAt = "starting_at"
        case status, note
        case league, localteam, visitorteam, runs, venue, stage
    }
}

// MARK: - League
struct League: Codable {
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

// MARK: - Run
struct Run2: Codable {
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

// MARK: - Team
struct Team3: Codable {
    var resource: FixResource?
    var id: Int?
    var name: String?
    var code: String?
    var imagePath: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case imagePath = "image_path"
        case updatedAt = "updated_at"
    }
}

enum FixResource: String, Codable {
    case teams = "teams"
}


// MARK: - Stage
struct Stage2: Codable {
    var resource: String?
    var id: Int?
    var name, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, name
        case updatedAt = "updated_at"
    }
}

// MARK: - Venue
struct Venue2: Codable {
    var resource: String?
    var id, countryID: Int?
    var name, city: String?
    var imagePath: String?
    var capacity: Int?
    var floodlight: Bool?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case countryID = "country_id"
        case name, city
        case imagePath = "image_path"
        case capacity, floodlight
        case updatedAt = "updated_at"
    }
}


