//
//  InfoViewModel.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import Foundation

class InfoViewModel {
    static let shared = InfoViewModel()
    private init() {}
    
    var observable = ObservableObject<InfoModel>()
    
    func getInfo(fixtureId: Int) {
        let url = InfoURL.getURL(fixtureId: fixtureId)
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<InfoModel,Error>) in
            switch result {
            case .success(let res) :
                self?.observable.result = res
            case .failure(let error):
                print(error)
            }
        }
    }
}
