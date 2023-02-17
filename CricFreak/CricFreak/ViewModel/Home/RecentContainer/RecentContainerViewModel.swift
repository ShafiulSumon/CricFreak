//
//  RecentContainerViewModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

class RecentContainerViewModel {
    
    var observable = ObservableObject<RecentModel>()
    
    let recentUrl = RecentMatchURL.getURL()
    
    func populateRecentTable() {
        HttpUtility.shared.getDataFromAPI(url: recentUrl) { [weak self] (result: Result<RecentModel?,Error>) in
            
            guard let self = self else { return }
            
            switch result {
            case .success(let res):
                self.observable.result = res
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setData(with data: RecentTableData) {
        HomeViewModel.shared.observable.result = data
    }
}
