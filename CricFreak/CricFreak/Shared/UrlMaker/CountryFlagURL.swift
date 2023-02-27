//
//  CountryFlagURL.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

struct CountryFlagURL {
    static func getURL() -> String {
        return "https://cricket.sportmonks.com/api/v2.0/countries?api_token=" + Constants.apiKey
    }
}
