//
//  Repository.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation

class Repository {
    static let shared = Repository()
    private init() {}
    
    var observable = ObservableObject<[EasySearchModel]>()
    
    func getData() {
        // if coredata does not have any data
        CoreDataManager.shared.getData()
        if(CoreDataManager.shared.players.isEmpty) {
            let url = SearchURL.getURL()
            
            HttpUtility.shared.getDataFromAPI(url: url) { [weak self] (result: Result<SearchModel?,Error>) in
                guard let self = self else { return }
                switch result {
                case .success(let res):
                    self.makeDataForAPI(data: res)
                case .failure(let error):
                    print(error)
                }
            }
        }
        else { // already data is cached
            DispatchQueue.global().async { [weak self] in
                //sleep(1)
                self?.makeDataForCoreData()
            }
            //makeDataForCoreData()
        }
    }
    
    func makeDataForAPI(data: SearchModel?) {
        DispatchQueue.global().async { [weak self] in
            CoreDataManager.shared.addData(data: (data?.data ?? []))
            self?.makeDataForCoreData()
        }
    }
    
    func makeDataForCoreData() {
        CoreDataManager.shared.getData()
        let players = CoreDataManager.shared.players
        print(players.count)
        var data: [EasySearchModel] = []
        
        for val in players {
            var x = EasySearchModel()
            
            x.id = Int(val.id)
            x.name = val.name ?? "Unknown"
            x.image_path = val.image_path ?? ""
            
            data.append(x)
        }
        print(data.count)
        observable.result = data
    }
}
