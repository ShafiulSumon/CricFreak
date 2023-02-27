//
//  SearchModel.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

// MARK: - Welcome
struct SearchModel: Codable {
    var data: [SearchData]?
}

// MARK: - Datum
struct SearchData: Codable {
    var resource: Resource2?
    var id: Int?
    var fullname: String?
    var imagePath: String?
    var updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case resource, id, fullname
        case imagePath = "image_path"
        case updatedAt = "updated_at"
    }
}

enum Resource2: String, Codable {
    case players = "players"
}
