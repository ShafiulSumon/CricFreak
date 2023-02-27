//
//  MatchesViewModel.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

class MatchesViewModel {
    var observable = ObservableObject<LeagueModel>()
    
    func getLeague() {
        let url = LeagueURL.getURL()

        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<LeagueModel?,Error>) in
            
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
