//
//  HomeViewModel.swift
//  CricFreak
//
//  Created by Admin on 17/2/23.
//

import Foundation

class HomeViewModel {
    static let shared = HomeViewModel()
    private init() {}
    
    var observable = ObservableObject<RecentTableData>()
    
}
