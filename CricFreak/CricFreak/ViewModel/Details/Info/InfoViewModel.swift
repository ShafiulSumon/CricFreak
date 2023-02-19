//
//  InfoViewModel.swift
//  CricFreak
//
//  Created by Admin on 19/2/23.
//

import Foundation

class InfoViewModel {
    var observable = ObservableObject<InfoModel>()
    var observableForFixture = ObservableObject<Int>()
    
    func getFixtureId() {
        HomeViewModel.shared.observable.binding() { [weak self] data in
            self?.observableForFixture.result = data?.id
        }
    }
    
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
