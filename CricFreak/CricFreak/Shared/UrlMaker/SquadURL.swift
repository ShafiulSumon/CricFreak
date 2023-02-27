//
//  SquadURL.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import Foundation

struct SquadURL {
    static func getURL(fixtureId: Int) -> String {
        
        return "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureId)" + "?fields[fixtures]=&include=lineup&fields[players]=fullname,image_path&api_token=" + Constants.apiKey
    }
}
