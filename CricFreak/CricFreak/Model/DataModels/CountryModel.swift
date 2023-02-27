//
//  CountryModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

// MARK: - Welcome
struct CountryModel: Codable {
    var data: [CountryData]?
}

// MARK: - Datum
struct CountryData: Codable {
    var resource: Reso?
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

enum Reso: String, Codable {
    case countries = "countries"
}
