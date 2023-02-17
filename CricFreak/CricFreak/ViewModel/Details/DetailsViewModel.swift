//
//  DetailsViewModel.swift
//  CricFreak
//
//  Created by Admin on 17/2/23.
//

import Foundation

class DetailsViewModel {
    var observable = ObservableObject<Int>()
    
    func receiveFixtureId() {
        HomeViewModel.shared.observable.binding() { [weak self] id in
            self?.observable.result = id
        }
    }
}
