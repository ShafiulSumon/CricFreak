//
//  FixtureURL.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import Foundation

struct FixtureURL {
    static func getURL(leagueId: Int) -> String {
        
        let (from, to) = DateManager.shared.get_start_and_end_date_Tuple(byMonths: 12)
        
        return "https://cricket.sportmonks.com/api/v2.0/fixtures?fields[fixtures]=league_id,round,note,starting_at,status&filter[starts_between]=\(from)" + ",%20" + "\(to)" + "&include=stage,venue,localteam,visitorteam,runs&sort=starting_at&fields[stages]=name&fields[teams]=name,code,image_path&filter[league_id]=\(leagueId)"+"&api_token=" + Constants.apiKey
    }
}
