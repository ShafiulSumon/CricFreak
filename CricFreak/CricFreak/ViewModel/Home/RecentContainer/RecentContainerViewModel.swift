//
//  RecentContainerViewModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

class RecentContainerViewModel {
    
    var observable = ObservableObject<RecentModel>()
    var countryFlagImg: [String : String] = [:]
    
    let recentUrl = RecentMatchURL.getURL()
    let countryUrl = CountryFlagURL.getURL()
    
    func populateRecentTable() {
        HttpUtility.shared.getDataFromAPI(url: countryUrl) { [weak self] (countryResult: Result<CountryModel,Error>) in
            
            switch countryResult {
            case .success(let res):
                for val in (res.data ?? []) {
                    self?.countryFlagImg[(val.name ?? "")] = val.imagePath ?? ""
                }
                HttpUtility.shared.getDataFromAPI(url: self?.recentUrl ?? "") { [weak self] (result: Result<RecentModel?,Error>) in
                    
                    guard let self = self else { return }
                    
                    switch result {
                    case .success(let res):
                        self.observable.result = res
                    case .failure(let error):
                        print(error)
                    }
                }
            case .failure(let error):
                print(error)
            }
            
        }
    }
}
