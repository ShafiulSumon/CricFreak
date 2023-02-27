//
//  Players+CoreDataProperties.swift
//  CricFreak
//
//  Created by Admin on 22/2/23.
//
//

import Foundation
import CoreData


extension Players {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Players> {
        return NSFetchRequest<Players>(entityName: "Players")
    }

    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var image_path: String?

}

extension Players : Identifiable {

}
