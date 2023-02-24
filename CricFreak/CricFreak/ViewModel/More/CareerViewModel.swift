//
//  CareerViewModel.swift
//  CricFreak
//
//  Created by Admin on 23/2/23.
//

import Foundation

class CareerViewModel {
    static let shared = CareerViewModel()
    private init() {}
    
    var observable = ObservableObject<CareerModel>()
    
    func getPlayerCareer(id: Int) {
        let url = PlayerCareerURL.getURL(id: id)
        
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<CareerModel?,Error>) in
            
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
