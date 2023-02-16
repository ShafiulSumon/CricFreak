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
    
    func getAllCountry() {
        HttpUtility.shared.getDataFromAPI(url: countryUrl) { [weak self] (countryResult: Result<CountryModel,Error>) in
            
            switch countryResult {
            case .success(let res):
                for val in (res.data ?? []) {
                    self?.countryFlagImg[(val.name ?? "")] = val.imagePath ?? ""
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
