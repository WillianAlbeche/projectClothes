//
//  Clothes.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 29/07/21.
//

import Foundation
import CloudKit

//class Clothes {
//
//    let id: CKRecord.ID?
//
//    var image: CKAsset?
//    var color: String?
//    var filters: [Filter]?
//    var seasons: [Season]?
//    var specials: [Special]?
//    var warm: Warm?
//    var confort: Confort?
//    var type: String?
//    var subType: String?
//    var tecido: String?
//    //brand: String
//    var gender: String?
//
//    private init(){
//        let newClothes = CKRecord.init(recordType: "Clothes")
//
//        id = newClothes.recordID
//    }
//
//    init(record: CKRecord) {
//        id = record.recordID
//
//        self.image = record["image"] as? CKAsset
//        self.color = record["color"] as? String
//
//        if
//            let filters = record["filters"] as? [Int],
//            let seasons = record["seasons"] as? [Int],
//            let specials = record["specials"] as? [Int],
//            let warm = record["warm"] as? Int,
//            let confort = record["confort"] as? Int,
//            let type = record["type"] as? String,
//            let subType = record["subType"] as? String,
//            let tecido = record["tecido"] as? String
//        {
//
//            var auxFilters = [Filter]()
//            var auxSeasons = [Season]()
//            var auxSpecials = [Special]()
//
//            for filter in filters {
//                if let filterValue = Filter(rawValue: filter){
//                    auxFilters.append(filterValue)
//                }
//            }
//
//            for season in seasons {
//                if let seasonValue = Season(rawValue: season){
//                    auxSeasons.append(seasonValue)
//                }
//            }
//
//            for special in specials {
//                if let specialValue = Special(rawValue: special){
//                    auxSpecials.append(specialValue)
//                }
//            }
//
//            let warm1 = Warm(rawValue: warm)
//            let confort1 = Confort(rawValue: confort)
//
//            self.filters = auxFilters
//            self.seasons = auxSeasons
//            self.specials = auxSpecials
//            self.warm = warm1
//            self.confort = confort1
//            self.type = type
//            self.subType = subType
//            self.tecido = tecido
//
//        }
//
//
//    }
//
//    static func createEmptyClothes() -> Clothes{
//        return Clothes.init()
//    }
//}
//
//extension Clothes: Hashable {
//    static func == (lhs: Clothes, rhs: Clothes) -> Bool {
//        return lhs.id == rhs.id
//    }
//
//    func hash(into hasher: inout Hasher) {
//        hasher.combine(id)
//    }
//}

//enum Filter: Int {
//
//    var id: Int { self.rawValue }
//
//    case Casual
//    case Formal
//    case Camping
//    case Work
//    case Beach
//    case Holiday
//    case Sports
//    case Party
//    case Date
//
//    func getName() -> String{
//        switch self {
//        case .Casual : return "Casual"
//        case .Formal : return "Formal"
//        case .Camping : return "Camping"
//        case .Work : return "Work"
//        case .Beach : return "Beach"
//        case .Holiday : return "Holiday"
//        case .Sports : return "Sports"
//        case .Party : return "Party"
//        case .Date : return "Date"
//        }
//    }
//}
//
//enum Season: Int {
//
//    var id: Int { self.rawValue }
//
//    case Fall
//    case Winter
//    case Summer
//    case Spring
//
//    func getName() -> String{
//        switch self {
//        case .Fall : return "Fall"
//        case .Winter : return "Winter"
//        case .Summer : return "Summer"
//        case .Spring : return "Spring"
//        }
//    }
//}
//
//enum Special: Int {
//
//    var id: Int { self.rawValue }
//
//    case Wind
//    case Rainning
//    case Snow
//    case SensitiveToRain
//
//    func getName() -> String{
//        switch self {
//        case .Wind : return "Wind"
//        case .Rainning : return "Rainning"
//        case .Snow : return "Snow"
//        case .SensitiveToRain : return "SensitiveToRain"
//        }
//    }
//}

class Clothes {
    
    let id: CKRecord.ID?
    var image: CKAsset?
    var color: String?
    var filters: [String]?
    var seasons: [String]?
    var specials: [String]?
    var warm: Warm?
    var confort: Confort?
    var type: String?
    var subType: String?
    var fabric: String?
    var brand: String?
    var gender: String?
    
    private init(){
        let newClothes = CKRecord.init(recordType: "Clothes")
        
        id = newClothes.recordID
    }
    
    init(record: CKRecord) {
        id = record.recordID
       
        self.image = record["image"] as? CKAsset
        self.color = record["color"] as? String
        self.filters = record["filters"] as? [String]
        self.seasons = record["seasons"] as? [String]
        self.specials = record["specials"] as? [String]
        self.type = record["type"] as? String
        self.subType = record["subType"] as? String
        self.fabric = record["fabric"] as? String
        self.brand = record["brand"] as? String
        self.gender = record["gender"] as? String
        
        if let warm = record["warm"] as? Int,
            let confort = record["confort"] as? Int
        {
            let warm1 = Warm(rawValue: warm)
            let confort1 = Confort(rawValue: confort)
           
            self.warm = warm1
            self.confort = confort1
            
        }
        
        
    }
    
    static func createEmptyClothes() -> Clothes{
        return Clothes.init()
    }
}

extension Clothes: Hashable {
    static func == (lhs: Clothes, rhs: Clothes) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

enum Warm: Int {
    
    var id: Int { self.rawValue }
    
    case Low
    case Medium
    case High
    
    func getName() -> String{
        switch self {
        case .Low : return "Low"
        case .Medium : return "Medium"
        case .High : return "High"
        }
    }
}

enum Confort: Int {
    
    var id: Int { self.rawValue }
    
    case Low
    case Medium
    case High
    
    func getName() -> String{
        switch self {
        case .Low : return "Low"
        case .Medium : return "Medium"
        case .High : return "High"
        }
    }
}
