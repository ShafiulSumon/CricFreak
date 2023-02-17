//
//  DetailsViewModel.swift
//  CricFreak
//
//  Created by Admin on 17/2/23.
//

import Foundation

class DetailsViewModel {
    var observable = ObservableObject<RecentTableData>()
    
    func receiveFixtureId() {
        HomeViewModel.shared.observable.binding() { [weak self] data in
            self?.observable.result = data
        }
    }
}
