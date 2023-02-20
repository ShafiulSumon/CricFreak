//
//  ScoreboardURL.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import Foundation

struct ScoreboardURL {
    static func getURL(fixtureId: Int) -> String {
        return "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureId)" + "?fields[fixtures]=status&include=batting.batsman,batting.bowler,batting.catchstump,batting.batsmanout,batting.runoutby&fields[battings]=team_id,ball,score,four_x,six_x,rate&fields[players]=fullname,lastname&api_token=yUQG6zjv4Bi5RtX9NMxzxISx2ehPcIkYMNBBpcDwgQ4R3f7Qa4igmoBR2W0I"
    }
}
