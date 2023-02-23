//
//  PlayerCareer.swift
//  CricFreak
//
//  Created by Admin on 23/2/23.
//

import Foundation

struct PlayerCareer {
    static func getURL(id: Int) -> String {
        return "https://cricket.sportmonks.com/api/v2.0/players/\(id)" + "?include=career,country&api_token=" + Constants.apiKey
    }
}
