//
//  FixtureListViewModel.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import Foundation

class FixtureListViewModel {
    static let shared = FixtureListViewModel()
    private init() {}
    
    var observable = ObservableObject<RecentModel>()
    
    func getData(leagueId: Int) {
        let url = FixtureURL.getURL(leagueId: leagueId)
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<RecentModel?,Error>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let res):
                self.observable.result = res
            case .failure(let error):
                print(error)
            }
        }
    }
}
