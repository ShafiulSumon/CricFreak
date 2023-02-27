//
//  CoreDataManager.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()
    private init() {}
    
    let context = AppDelegate.shared.persistentContainer.viewContext
    var players: [Players] = []
    
    func getData() {
        do {
            let request = NSFetchRequest<Players>(entityName: "Players")
            players = try context.fetch(request)
        }
        catch {
            print(error)
        }
    }
    
    func addData(data: [SearchData]) {
        
        var dataArray = [[String: Any]]()
        for val in data {
            if let id = val.id,
               let name = val.fullname,
               let img = val.imagePath {
                let dict: [String: Any] = ["id": Int32(id), "name": name, "image_path": img]
                dataArray.append(dict)
            }
        }
        let batchInsert = NSBatchInsertRequest(entity: Players.entity(), objects: dataArray)
        do {
            let result = try context.execute(batchInsert) as? NSBatchInsertResult
        } catch {
            print(error)
        }
    }
}
