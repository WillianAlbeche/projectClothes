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
    lazy var roupa00: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        
        let image = UIImage(named: "Image-1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        
        roupa.type = "super"
        roupa.subType = "super1"
        
        
        return roupa
        
    }()

    lazy var roupa01: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super1"
        
        
        
        return roupa
        
    }()
    lazy var roupa02: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super2"
        return roupa
        
    }()
    lazy var roupa03: Clothes = {
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image-1.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: imageURL)
        
        roupa.type = "super"
        roupa.subType = "super3"
        return roupa
        
    }()
    
    
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
        roupa.filters = []
        roupa.filters?.append("bananinha")
        roupa.filters?.append("limao")
        roupa.filters?.append("swiftUI")
        roupa.filters?.append("jiu jitsu")
        roupa.filters?.append("rock and roll")
        roupa.filters?.append("onomatipeia ")
        roupa.filters?.append("inconstitucionalicimamente")
        roupa.specials = []
        roupa.seasons = []
        
        roupa.seasons?.append("spring")
        roupa.seasons?.append("summer")
        roupa.seasons?.append("autumn")
        roupa.seasons?.append("winter")
        
        roupa.specials?.append("wind")
        roupa.specials?.append("rain")
        roupa.specials?.append("snow")
        roupa.specials?.append("sensitiveRain")
//        spring, summer, autumn, and winter
//        wind, rain, snow, sensitiveRain
        return roupa
        
    }()
    
    
    static var roupasMock : [Clothes] = []

    

    static var look1: Look = {
        var look : Look = Look.createEmptyClothes()
        
        
        let image = UIImage(named: "redDress")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        look.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        look.filters = []
        look.filters?.append("casual")
        
        
        
        return look
        
    }()
    static var look2: Look = {
        var look : Look = Look.createEmptyClothes()
        
        
        let image = UIImage(named: "redDress")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        look.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        look.filters = []
        look.filters?.append("formal")
        look.filters?.append("casual")
        
        
        
        return look
        
    }()

    static  var look3: Look = {
        var look : Look = Look.createEmptyClothes()
        
        
        let image = UIImage(named: "redDress")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        look.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        look.filters = []
        look.filters?.append("festa")
        look.filters?.append("formal")
        look.filters?.append("casual")
     
        
        
        
        return look
        
    }()
    static var looksMock : [Look] = []
    init(){
        
        var roupa : Clothes = Clothes.createEmptyClothes()
        
        let image = UIImage(named: "camisa2")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa.image = CKAsset.init(fileURL: image?.toURL() ?? imageURL)
        
        roupa.type = "peça superior"
        roupa.subType = "camiseta"
        roupa.filters = []
        roupa.filters?.append("casual")
        roupa.specials = []
        roupa.seasons = []
        roupa.seasons?.append("spring")
        roupa.seasons?.append("summer")
        roupa.seasons?.append("autumn")
        roupa.seasons?.append("winter")
        
        
        MockClothesData.roupasMock.append(roupa)
        
        var roupa2 : Clothes = Clothes.createEmptyClothes()
        
        let image2 = UIImage(named: "casaco1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa2.image = CKAsset.init(fileURL: image2?.toURL() ?? imageURL)
        
        roupa2.type = "peça superior"
        roupa2.subType = "casaco"
        roupa2.filters = []
        roupa2.filters?.append("casual")
        roupa2.specials = []
        roupa2.seasons = []
        
        roupa2.seasons?.append("autumn")
        roupa2.seasons?.append("winter")

        roupa2.specials?.append("wind")
        roupa2.specials?.append("rain")
        roupa2.specials?.append("snow")
        roupa2.specials?.append("sensitiveRain")
        MockClothesData.roupasMock.append(roupa2)

        
        var roupa3 : Clothes = Clothes.createEmptyClothes()
        
        let image3 = UIImage(named: "sobretudo1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa3.image = CKAsset.init(fileURL: image3?.toURL() ?? imageURL)
        
        roupa3.type = "peça superior"
        roupa3.subType = "sobretudo"
        roupa3.filters = []
        roupa3.filters?.append("encontro")
        roupa3.filters?.append("formal")
        roupa3.specials = []
        roupa3.seasons = []
        
        roupa3.seasons?.append("autumn")
        roupa3.seasons?.append("winter")

        roupa3.specials?.append("wind")
        roupa3.specials?.append("rain")
        roupa3.specials?.append("snow")
        MockClothesData.roupasMock.append(roupa3)

        var roupa4 : Clothes = Clothes.createEmptyClothes()
        
        let image4 = UIImage(named: "tenis")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa4.image = CKAsset.init(fileURL: image4?.toURL() ?? imageURL)
        
        roupa4.type = "sapato"
        roupa4.subType = "corrida"
        roupa4.filters = []
        roupa4.filters?.append("casual")
        roupa4.filters?.append("esportivo")
        roupa4.specials = []
        roupa4.seasons = []
        
        roupa4.seasons?.append("spring")
        roupa4.seasons?.append("summer")
        roupa4.seasons?.append("autumn")
        roupa4.seasons?.append("winter")

        roupa4.specials?.append("wind")
        roupa4.specials?.append("rain")
        roupa4.specials?.append("snow")
        MockClothesData.roupasMock.append(roupa4)
        
        
        var roupa5 : Clothes = Clothes.createEmptyClothes()
        
        let image5 = UIImage(named: "calca1")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa5.image = CKAsset.init(fileURL: image5?.toURL() ?? imageURL)
        
        roupa5.type = "peça inferior"
        roupa5.subType = "calça"
        roupa5.filters = []
        roupa5.filters?.append("encontro")
        roupa5.filters?.append("formal")
        roupa5.specials = []
        roupa5.seasons = []
        
        roupa5.seasons?.append("autumn")
        roupa5.seasons?.append("winter")

        roupa5.specials?.append("wind")
        roupa5.specials?.append("rain")
        roupa5.specials?.append("snow")
        MockClothesData.roupasMock.append(roupa5)
        
        
        var roupa6 : Clothes = Clothes.createEmptyClothes()
        
        let image6 = UIImage(named: "calca2")
        
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa6.image = CKAsset.init(fileURL: image6?.toURL() ?? imageURL)
        
        roupa6.type = "peça inferior"
        roupa6.subType = "calça"
        roupa6.filters = []
        roupa6.filters?.append("esportiva")
        roupa6.filters?.append("casa")
        roupa6.specials = []
        roupa6.seasons = []
        
        roupa6.seasons?.append("autumn")
        roupa6.seasons?.append("winter")

        roupa6.specials?.append("wind")
        roupa6.specials?.append("rain")
        roupa6.specials?.append("snow")
        MockClothesData.roupasMock.append(roupa6)
        
        
        
        var roupa7 : Clothes = Clothes.createEmptyClothes()
        let image7 = UIImage(named: "calca2")
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa7.image = CKAsset.init(fileURL: image7?.toURL() ?? imageURL)
        roupa7.type = "peça inferior"
        roupa7.subType = "calça"
        roupa7.filters = []
        roupa7.filters?.append("esportiva")
        roupa7.filters?.append("casa")
        roupa7.specials = []
        roupa7.seasons = []
        
        roupa7.seasons?.append("autumn")
        roupa7.seasons?.append("winter")

        roupa7.specials?.append("wind")
        roupa7.specials?.append("rain")
        roupa7.specials?.append("snow")
        MockClothesData.roupasMock.append(roupa7)

        var roupa8 : Clothes = Clothes.createEmptyClothes()
        let image8 = UIImage(named: "camisa1")
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa8.image = CKAsset.init(fileURL: image8?.toURL() ?? imageURL)
        roupa8.type = "peça superior"
        roupa8.subType = "camisa"
        roupa8.filters = []
        roupa8.filters?.append("formal")
        roupa8.filters?.append("trabalho")
        roupa8.specials = []
        roupa8.seasons = []
        roupa8.seasons?.append("autumn")
        roupa8.seasons?.append("winter")
        roupa8.specials?.append("wind")
        MockClothesData.roupasMock.append(roupa8)
        
        var roupa9 : Clothes = Clothes.createEmptyClothes()
        let image9 = UIImage(named: "bota")
        guard let imageURL = NSURL(fileURLWithPath: NSTemporaryDirectory()).appendingPathComponent("Image2.png") else {
            fatalError("problema nem fetch imagem nas roupas mock")
        }
        roupa9.image = CKAsset.init(fileURL: image9?.toURL() ?? imageURL)
        roupa9.type = "sapato"
        roupa9.subType = "bota"
        roupa9.filters = []
        roupa9.filters?.append("formal")
        roupa9.filters?.append("trabalho")
        roupa9.specials = []
        roupa9.seasons = []
        roupa9.seasons?.append("autumn")
        roupa9.seasons?.append("winter")
        roupa9.specials?.append("wind")
        MockClothesData.roupasMock.append(roupa9)

        
        
        
    }

}
