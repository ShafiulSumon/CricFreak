//
//  CountryFlags.swift
//  CricFreak
//
//  Created by Admin on 16/2/23.
//

import Foundation

final class CountryFlags {
    static let shared = CountryFlags()
    private init() {}
    
    var countryFlagImg: [String : String] = [:]
    let countryUrl = CountryFlagURL.getURL()
    
    func getAllCountry(res: CountryModel?) {
        for val in (res?.data ?? []) {
            countryFlagImg[(val.name ?? "")] = val.imagePath ?? ""
        }
    }
}
