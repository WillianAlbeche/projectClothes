//
//  Clothes+CoreDataProperties.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 26/08/21.
//
//

import Foundation
import CoreData


extension Clothes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clothes> {
        return NSFetchRequest<Clothes>(entityName: "Clothes")
    }
    
    convenience init(image: Data?, color: String?, filters: [String]?, seasons: [String]?, specials: [String]?, warm: Double?, fabric: String?, brand: String?, gender: String?, type: String?, subType: String?){
        let entity = NSEntityDescription.entity(forEntityName: Self.className, in: Self.context)
        self.init(entity: entity!, insertInto: Self.context)
        self.image = image
        self.color = color
        self.filters = filters
        self.seasons = seasons
        self.specials = specials
        self.warm = warm ?? 0
        self.fabric = fabric
        self.brand = brand
        self.gender = gender
        self.type = type
        self.subType = subType
    }

    @NSManaged public var image: Data?
    @NSManaged public var color: String?
    @NSManaged public var filters: [String]?
    @NSManaged public var seasons: [String]?
    @NSManaged public var specials: [String]?
    @NSManaged public var warm: Double
    @NSManaged public var fabric: String?
    @NSManaged public var brand: String?
    @NSManaged public var gender: String?
    @NSManaged public var type: String?
    @NSManaged public var subType: String?

}

extension Clothes : Identifiable {

}
