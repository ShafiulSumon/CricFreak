//
//  SquadViewModel.swift
//  CricFreak
//
//  Created by Admin on 21/2/23.
//

import Foundation

class SquadViewModel {
    static let shared = SquadViewModel()
    private init() {}
    
    var observable = ObservableObject<SquadModel>()
    var teamObservable = ObservableObject<RecentTableData>()
    
    func getSquad(fixtureId: Int, data: RecentTableData) {
        let url = SquadURL.getURL(fixtureId: fixtureId)
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<SquadModel,Error>) in
            self?.teamObservable.result = data
            switch result {
            case .success(let res) :
                self?.observable.result = res
            case .failure(let error):
                print(error)
            }
        }
    }
}
