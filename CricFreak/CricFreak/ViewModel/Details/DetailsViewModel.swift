//
//  DetailsViewModel.swift
//  CricFreak
//
//  Created by Admin on 17/2/23.
//

import Foundation

class DetailsViewModel {
    static let shared = DetailsViewModel()
    private init() {}
    
    var observable = ObservableObject<RecentTableData>()
    
    func receiveFixtureData() {
        HomeViewModel.shared.observable.binding() { [weak self] data in
            self?.observable.result = data
        }
    }
}
