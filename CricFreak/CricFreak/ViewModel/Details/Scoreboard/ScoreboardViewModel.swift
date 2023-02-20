//
//  ScoreboardViewModel.swift
//  CricFreak
//
//  Created by Admin on 20/2/23.
//

import Foundation

class ScoreboardViewModel {
    static let shared = ScoreboardViewModel()
    private init() {} 
    
    var observable = ObservableObject<ScoreboardModel>()
    var team: [Int:String] = [:]
    var teamName: [String] = []
    
    func getScore(fixtureId: Int) {
        let url = ScoreboardURL.getURL(fixtureId: fixtureId)
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<ScoreboardModel,Error>) in
            switch result {
            case .success(let res) :
                self?.observable.result = res
            case .failure(let error):
                print(error)
            }
        }
    }
}
