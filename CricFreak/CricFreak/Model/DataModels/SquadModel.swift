//
//  SquadModel.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import Foundation

// MARK: - Welcome
struct SquadModel: Codable {
    var data: SquadData?
}

// MARK: - DataClass
struct SquadData: Codable {
    var resource: String?
    var id: Int?
    var lineup: [LineupElement]?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case lineup
    }
}

// MARK: - LineupElement
struct LineupElement: Codable {
    var resource: Resource?
    var id: Int?
    var fullname: String?
    var imagePath: String?
    var updatedAt: String?
    var lineup: LineupLineup?

    enum CodingKeys: String, CodingKey {
        case resource, id, fullname
        case imagePath = "image_path"
        case updatedAt = "updated_at"
        case lineup
    }
}

// MARK: - LineupLineup
struct LineupLineup: Codable {
    var teamID: Int?
    var captain, wicketkeeper, substitution: Bool?

    enum CodingKeys: String, CodingKey {
        case teamID = "team_id"
        case captain, wicketkeeper, substitution
    }
}

enum Resource: String, Codable {
    case players = "players"
}
