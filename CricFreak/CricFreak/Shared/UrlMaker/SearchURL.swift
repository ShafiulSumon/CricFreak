//
//  SearchURL.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

struct SearchURL {
    static func getURL() -> String {
        return "https://cricket.sportmonks.com/api/v2.0/players?fields[players]=fullname,image_path&api_token=" + Constants.apiKey
    }
}
