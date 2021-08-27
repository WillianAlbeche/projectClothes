//
//  Look+CoreDataProperties.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 26/08/21.
//
//

import Foundation
import CoreData


extension Look {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Look> {
        return NSFetchRequest<Look>(entityName: "Look")
    }

    @NSManaged public var filters: [String]?
    @NSManaged public var image: Data?

}

extension Look : Identifiable {

}
