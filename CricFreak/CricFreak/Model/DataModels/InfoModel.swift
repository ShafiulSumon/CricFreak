//
//  InfoModel.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import Foundation

//// MARK: - Welcome
//struct InfoModel: Codable {
//    let data: InfoData?
//}
//
//// MARK: - DataClass
//struct InfoData: Codable {
//    let resource: String?
//    let id: Int?
//    let round, startingAt, status: String?
//    let referee, firstumpire, secondumpire, tvumpire: Firstumpire?
//    let tosswon: String?
//    let venue: Venue?
//    let stage: Stage?
//
//    enum CodingKeys: String, CodingKey {
//        case resource, id, round
//        case startingAt = "starting_at"
//        case status
//        case referee, firstumpire, secondumpire, tvumpire, tosswon, venue, stage
//    }
//}
//
//// MARK: - Firstumpire
//struct Firstumpire: Codable {
//    let fullname: String?
//}

// MARK: - Welcome
struct InfoModel: Codable {
    var data: InfoData?
}

// MARK: - DataClass
struct InfoData: Codable {
    var resource: String?
    var id: Int?
    var round, startingAt, status: String?
    var referee, firstumpire, secondumpire, tvumpire: Firstumpire?
    var tosswon: Firstumpire?
    var venue: Venue?
    var stage: Firstumpire?

    enum CodingKeys: String, CodingKey {
        case resource, id, round
        case startingAt = "starting_at"
        case status
        case referee, firstumpire, secondumpire, tvumpire, tosswon, venue, stage
    }
}

// MARK: - Firstumpire
struct Firstumpire: Codable {
    var resource: String?
    var id: Int?
    var fullname, updatedAt, name: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, fullname
        case updatedAt = "updated_at"
        case name
    }
}
