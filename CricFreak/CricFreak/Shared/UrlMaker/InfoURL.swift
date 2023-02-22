//
//  InfoURL.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import Foundation

struct InfoURL {
    static func getURL(fixtureId: Int) -> String {
        return "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureId)" + "?fields[fixtures]=round,starting_at,status&include=stage,venue,firstumpire,secondumpire,tvumpire,referee,tosswon&fields[stages]=name&fields[officials]=fullname&fields[teams]=name&api_token=" + Constants.apiKey
    }
}
