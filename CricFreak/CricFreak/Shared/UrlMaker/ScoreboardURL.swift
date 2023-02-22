//
//  ScoreboardURL.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import Foundation

struct ScoreboardURL {
    static func getURL(fixtureId: Int) -> String {
        
        return "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureId)" + "?fields[fixtures]=status&include=localteam,visitorteam,batting.batsman,batting.bowler,batting.catchstump,batting.batsmanout,batting.runoutby,bowling.bowler&fields[battings]=scoreboard,team_id,ball,score,four_x,six_x,rate&fields[players]=fullname,lastname&fields[bowlings]=scoreboard,overs,medians,runs,wickets,wide,rate&fields[teams]=name,code&api_token=" + Constants.apiKey
    }
}
