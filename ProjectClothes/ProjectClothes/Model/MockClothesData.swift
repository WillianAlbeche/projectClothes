//
//  MockClothesData.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 11/08/21.
//

import Foundation
import UIKit
import CloudKit

class MockClothesData {

    
    lazy var roupa1: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super1"
        
        
        
        return roupa
        
    }()
    lazy var roupa2: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super2"
        return roupa
        
    }()
    lazy var roupa3: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super3"
        return roupa
        
    }()
    lazy var roupa4: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super4"
        
        return roupa
        
    }()
    
    lazy var roupa5: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        let image = UIImage(named: "Image-1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        roupa.type = "infra"
        roupa.subType = "infra1"
        
        
        
        return roupa
        
    }()
    lazy var roupa6: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        let image = UIImage(named: "Image-1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        roupa.type = "infra"
        roupa.subType = "infra2"
        
        
        
        return roupa
        
    }()
    lazy var roupa7: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        
        let image = UIImage(named: "Image-1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        
        roupa.type = "meio"
        roupa.subType = "infra2"
        
        
        
        return roupa
        
    }()
    lazy var roupa8: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        let image = UIImage(named: "Image2")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        roupa.type = "meio"
        roupa.subType = "infra3"
        
        
        
        return roupa
        
    }()
    
    var roupasMock : [Clothes] {
        return [ roupa1,roupa2,roupa3,roupa4,roupa5,roupa6,roupa7,roupa8] }
    
    
    
    
    
    
    
}







