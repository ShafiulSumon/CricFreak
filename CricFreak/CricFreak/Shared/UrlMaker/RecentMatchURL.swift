//
//  RecentMatchURL.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

struct RecentMatchURL {
    static func getURL() -> String {
        let (from, to) = DateManager.shared.get_start_and_end_date_Tuple(byMonths: -2)
        
        return "https://cricket.sportmonks.com/api/v2.0/fixtures?fields[fixtures]=league_id,round,note,starting_at,status&include=stage,venue,localteam,visitorteam,runs&sort=-starting_at&fields[stages]=name&fields[teams]=name,code,image_path&api_token=" + Constants.apiKey + "&filter[starts_between]=\(from)"+","+"\(to)"
    }
}
