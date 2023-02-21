//
//  SquadURL.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import Foundation

struct SquadURL {
    static func getURL(fixtureId: Int) -> String {
        
        return "https://cricket.sportmonks.com/api/v2.0/fixtures/\(fixtureId)" + "?fields[fixtures]=&include=lineup&fields[players]=fullname,image_path&api_token=yUQG6zjv4Bi5RtX9NMxzxISx2ehPcIkYMNBBpcDwgQ4R3f7Qa4igmoBR2W0I"
    }
}
