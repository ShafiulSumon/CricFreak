//
//  RankingURL.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import Foundation


struct RankingURL {
    static func getURL(leagueId: Int) -> String {
        return "https://cricket.sportmonks.com/api/v2.0/team-rankings?api_token=" + Constants.apiKey
    }
}
