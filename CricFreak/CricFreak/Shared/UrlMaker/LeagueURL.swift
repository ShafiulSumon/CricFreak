//
//  LeagueURL.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

struct LeagueURL {
    static func getURL() -> String {
        
        return "https://cricket.sportmonks.com/api/v2.0/leagues?api_token=" + Constants.apiKey
    }
}
