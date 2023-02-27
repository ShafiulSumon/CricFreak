//
//  SearchViewModel.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

class SearchViewModel {
    static let shared = SearchViewModel()
    private init() {}
    
    var observable = ObservableObject<[EasySearchModel]>()
    
    func getData() {
        Repository.shared.getData()
        
        Repository.shared.observable.binding() { [weak self] res in
            self?.observable.result = res
        }
    }
}
