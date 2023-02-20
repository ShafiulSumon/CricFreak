//
//  ScoreboardModel.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import Foundation

// MARK: - Welcome
struct ScoreboardModel: Codable {
    var data: ScoreboardData?
}

// MARK: - DataClass
struct ScoreboardData: Codable {
    var resource: String?
    var id: Int?
    var status: String?
    var batting: [Batting]?

    enum CodingKeys: String, CodingKey {
        case resource, id, status
        case batting
    }
}

// MARK: - Batting
struct Batting: Codable {
    var resource: BattingResource?
    var id, teamID, ball, score: Int?
    var fourX, sixX, rate: Int?
    var batsman: Batsman?
    var bowler, catchstump, batsmanout, runoutby: Batsman?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case teamID = "team_id"
        case ball, score
        case fourX = "four_x"
        case sixX = "six_x"
        case rate
        case batsman, bowler, catchstump, batsmanout, runoutby
    }
}

// MARK: - Batsman
struct Batsman: Codable {
    var resource: BatsmanResource?
    var id: Int?
    var lastname, fullname: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, lastname, fullname
    }
}

enum BatsmanResource: String, Codable {
    case players = "players"
}

enum BattingResource: String, Codable {
    case battings = "battings"
}
