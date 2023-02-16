//
//  UpcomingContainerViewModel.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

class UpcomingContainerViewModel {
    
    var observable = ObservableObject<RecentModel>()
    
    let upcomingUrl = UpcomingMatchURL.getURL()
    
    
    func populateUpcomingTable() {
        HttpUtility.shared.getDataFromAPI(url: upcomingUrl) { [weak self] (response: Result<RecentModel,Error>) in
            
            switch response {
            case .success(let result) :
                self?.observable.result = result
            case .failure(let error) :
                print(error)
            }
        }
    }
}
