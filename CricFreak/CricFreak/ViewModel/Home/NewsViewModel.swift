//
//  NewsViewModel.swift
//  CricFreak
//
//  Created by Admin on 25/2/23.
//

import Foundation

class NewsViewModel {
    var observable = ObservableObject<NewsModel>()
    
    func getNews() {
        let url = NewsURL.getURL()
        HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (response: Result<NewsModel,Error>) in
            
            switch response {
            case .success(let result) :
                self?.observable.result = result
            case .failure(let error) :
                print(error)
            }
        }
    }
}
