//
//  RankingViewModel.swift
//  CricFreak
//
//  Created by Admin on 24/2/23.
//

import Foundation

class RankingViewModel {
    var observable = ObservableObject<RankingModel>()
    
    func getRankingData() {
        let url = RankingURL.getURL()
        
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<RankingModel?,Error>) in
            
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
