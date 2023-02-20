//
//  ScoreboardModel.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import Foundation

//// MARK: - Welcome
//struct ScoreboardModel: Codable {
//    var data: ScoreboardData?
//}
//
//// MARK: - DataClass
//struct ScoreboardData: Codable {
//    var resource: String?
//    var id: Int?
//    var status: String?
//    var localteam, visitorteam: Team2?
//    var batting: [Batting]?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, status
//        case localteam, visitorteam, batting
//    }
//}
//
//// MARK: - Batting
//struct Batting: Codable {
//    var resource: BattingResource?
//    var id, teamID: Int?
//    var scoreboard: Scoreboard?
//    var ball, score, fourX, sixX: Int?
//    var rate: Int?
//    var updatedAt: String?
//    var batsman: Batsman?
//    var bowler, catchstump, batsmanout, runoutby: Batsman?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id
//        case teamID = "team_id"
//        case scoreboard, ball, score
//        case fourX = "four_x"
//        case sixX = "six_x"
//        case rate
//        case updatedAt = "updated_at"
//        case batsman, bowler, catchstump, batsmanout, runoutby
//    }
//}
//
//// MARK: - Batsman
//struct Batsman: Codable {
//    var resource: BatsmanResource?
//    var id: Int?
//    var lastname, fullname, updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, lastname, fullname
//        case updatedAt = "updated_at"
//    }
//}
//
//enum BatsmanResource: String, Codable {
//    case players = "players"
//}
//
//enum BattingResource: String, Codable {
//    case battings = "battings"
//}
//
//enum Scoreboard: String, Codable {
//    case s1 = "S1"
//    case s2 = "S2"
//}
//
//
//// MARK: - Team
//struct Team2: Codable {
//    var resource: String?
//    var id: Int?
//    var name, code, updatedAt: String?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, name, code
//        case updatedAt = "updated_at"
//    }
//}

// MARK: - Welcome
struct ScoreboardModel: Codable {
    var data: ScoreboardData?
}

// MARK: - DataClass
struct ScoreboardData: Codable {
    var resource: String?
    var id: Int?
    var status: String?
    var localteam, visitorteam: Team2?
    var batting: [Batting]?
    var bowling: [Bowling]?

    enum CodingKeys: String, CodingKey {
        case resource, id, status
        case localteam, visitorteam, batting, bowling
    }
}

// MARK: - Batting
struct Batting: Codable {
    var resource: BattingResource?
    var id, teamID: Int?
    var scoreboard: Scoreboard?
    var ball, score, fourX, sixX: Int?
    var rate: Int?
    var updatedAt: String?
    var batsman: Batsman?
    var bowler, catchstump, batsmanout, runoutby: Batsman?

    enum CodingKeys: String, CodingKey {
        case resource, id
        case teamID = "team_id"
        case scoreboard, ball, score
        case fourX = "four_x"
        case sixX = "six_x"
        case rate
        case updatedAt = "updated_at"
        case batsman, bowler, catchstump, batsmanout, runoutby
    }
}

// MARK: - Batsman
struct Batsman: Codable {
    var resource: BatsmanResource?
    var id: Int?
    var lastname, fullname, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, lastname, fullname
        case updatedAt = "updated_at"
    }
}

enum BatsmanResource: String, Codable {
    case players = "players"
}

enum BattingResource: String, Codable {
    case battings = "battings"
}

enum Scoreboard: String, Codable {
    case s1 = "S1"
    case s2 = "S2"
}


// MARK: - Bowling
struct Bowling: Codable {
    var resource: BowlingResource?
    var id: Int?
    var scoreboard: Scoreboard?
    var overs: Double?
    var medians, runs, wickets, wide: Int?
    var rate: Double?
    var updatedAt: String?
    var bowler: Batsman?

    enum CodingKeys: String, CodingKey {
        case resource, id, scoreboard, overs, medians, runs, wickets, wide, rate
        case updatedAt = "updated_at"
        case bowler
    }
}

enum BowlingResource: String, Codable {
    case bowlings = "bowlings"
}

// MARK: - Team
struct Team2: Codable {
    var resource: String?
    var id: Int?
    var name, code, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, name, code
        case updatedAt = "updated_at"
    }
}
