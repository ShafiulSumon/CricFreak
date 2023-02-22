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
//            if name != "" {
//                let predicate = NSPredicate(format: "name CONTAINS %@", name)
//                request.predicate = predicate
//            }
            players = try context.fetch(request)
        }
        catch {
            print(error)
        }
    }
    
    func addData(data: [SearchData]) {
        for val in data {
            if let id = val.id,
               let name = val.fullname,
               let img = val.imagePath {
                let newRow = Players(context: context)
                newRow.id = Int32(id)
                newRow.name = name
                newRow.image_path = img
                do {
                    try context.save()
                    //players.append(newRow)
                }
                catch {
                    print(error)
                }
            }
        }
    }
}
