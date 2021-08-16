//
//  SuperRoupaTableViewCell.swift
//  Wardrobe
//
//  Created by Heitor Feijó Kunrath on 09/08/21.
//

import UIKit

class SuperRoupaTableViewCell: UITableViewCell {

    @IBOutlet weak var subClassesCollecionView: UICollectionView!
    @IBOutlet weak var superClassNameLabel: UILabel!
    
    @IBOutlet weak var constraintCollectionViewHeight: NSLayoutConstraint!
    var thisSuperClothesArray : [Clothes]?
    var thisSubtypesClothesDic: [String:[Clothes]]?
    var subTypesNames : [String]?
    var segueSubtypes : (()->())?
    var countCellSubTypes : Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        subClassesCollecionView.delegate = self
        subClassesCollecionView.dataSource = self
        subClassesCollecionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        constraintCollectionViewHeight.constant = UIScreen.screenWidth*0.41
        
       
        
    }
    func setUpSubTypesDic(){
        subTypesNames = []
        guard let unwrappedSuperClothes = thisSuperClothesArray else {
            countCellSubTypes = 0
            
            return
//            fatalError("Problemas em thisSuperClothesArray setUpSubTypesDic SuperRoupasTableView")
            
        }
        
        for clothe in unwrappedSuperClothes{
            guard let currentClotheSubType = clothe.subType else{
             print("somethingWrong with unwrapedClothes in superRoupaTableView")
                continue
            }
//            print("--------")
//            print(subTypesNames?.contains(currentClotheSubType))
//            print("--------")
            
            if subTypesNames?.contains(currentClotheSubType) == false{
                subTypesNames?.append(currentClotheSubType)
                thisSubtypesClothesDic?[currentClotheSubType] = [clothe]
                
                
            }else{
                // so da append no dict
                thisSubtypesClothesDic?[currentClotheSubType]?.append(clothe)
            }
        }
        countCellSubTypes = thisSubtypesClothesDic?.count ?? 0

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
        
}

extension SuperRoupaTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print("====================")
//        print(countCellSubTypes)
        
        return thisSuperClothesArray?.count ?? 0
        
    }
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

         let collectionCell = subClassesCollecionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FrontCollectionViewCell
       
//        guard let thisSubTypeName = subTypesNames?[indexPath.item], let thisSubTypeArray = thisSubtypesClothesDic?[thisSubTypeName] else{
//
//            collectionCell.pictureOfSubType.backgroundColor = .gray
//
//            return collectionCell
//        }
        
//        collectionCell.pictureOfSubType.image = thisSubTypeArray.first?.image?.toUIImage()
        collectionCell.pictureOfSubType.image = thisSuperClothesArray?[indexPath.item].image?.toUIImage() ?? nil
        if collectionCell.pictureOfSubType.image == nil{
            
            collectionCell.pictureOfSubType.backgroundColor = .gray
            
        }
        
        collectionCell.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor
        collectionCell.layer.cornerRadius = 50
        
//        collectionCell.layer.shadowColor = UIColor.black.cgColor
//        collectionCell.layer.shadowOpacity = 1
//        collectionCell.layer.shadowOffset = .zero
//        collectionCell.layer.shadowRadius = 10
//        collectionCell.layer.cornerRadius = 21
//        collectionCell.layer.borderWidth = 20
//        collectionCell.layer.borderColor = UIColor.green.cgColor
        
        
            return collectionCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lado = UIScreen.screenWidth*0.4
        return CGSize(width: lado , height: lado)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let segue = segueSubtypes!
        
        segue()
        
        
    }
    
    
    
}

