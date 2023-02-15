//
//  RecentMatchURL.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

struct RecentMatchURL {
    static func getURL() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        
        let date2 = Date()
        
        let calender = Calendar.current
        
        let date1 = calender.date(byAdding: .month, value: -1, to: date2)
        
        let to = dateFormatter.string(from: date2)
        let from = dateFormatter.string(from: date1!)
        
        
        return "https://cricket.sportmonks.com/api/v2.0/fixtures?fields[fixtures]=league_id,round,note,starting_at,status&include=stage,venue,localteam,visitorteam,runs&sort=-starting_at&fields[stages]=name&fields[teams]=name,code,image_path&api_token=yUQG6zjv4Bi5RtX9NMxzxISx2ehPcIkYMNBBpcDwgQ4R3f7Qa4igmoBR2W0I&filter[starts_between]=\(from)"+","+"\(to)"
    }
}
