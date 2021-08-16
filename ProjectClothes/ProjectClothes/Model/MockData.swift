//
//  MockData.swift
//  ProjectClothes
//
//  Created by Hojin Ryu on 15/08/21.
//

import Foundation

import Foundation
import UIKit
import CloudKit

class MockData {
    
    
    lazy var roupa1: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        
        var auxFilters = ["Camping, Holiday"]
        var auxSeasons = ["Winter"]
        var auxSpecials = ["Wind"]
        
        guard let mockConfort = Confort(rawValue: 1),
              let mockWarm = Warm(rawValue: 1)
        else { return roupa }
        roupa.image = CKAsset.init(fileURL: imageURL)
        roupa.color = "red"
        roupa.filters = auxFilters
        roupa.seasons = auxSeasons
        roupa.specials = auxSpecials
        roupa.confort = mockConfort
        roupa.warm = mockWarm
        roupa.fabric = "wool1"
        roupa.brand = "nike"
        roupa.gender = "male"
        roupa.type = "typ1"
        roupa.subType = "subtype"
        
        
        
        return roupa
        
    }()
    lazy var roupa2: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        var auxFilters = ["Camping, Formal"]
        var auxSeasons = ["Spring"]
        var auxSpecials = ["Rainning"]
        roupa.image = CKAsset.init(fileURL: imageURL)
        roupa.color = "Black"
        roupa.filters = auxFilters
        roupa.seasons = auxSeasons
        roupa.specials = auxSpecials
        return roupa
        
    }()
    
    lazy var roupa3: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        var auxFilters = ["Work, Formal"]
        var auxSeasons = ["Spring"]
        var auxSpecials = ["Rainning"]
        roupa.image = CKAsset.init(fileURL: imageURL)
        roupa.color = "Blue"
        roupa.filters = auxFilters
        roupa.seasons = auxSeasons
        roupa.specials = auxSpecials
        return roupa
        
    }()
    
    
    var roupasMock : [Clothes] {
        return [ roupa1,roupa2, roupa3 ] }
    
}
