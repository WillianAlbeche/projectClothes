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
    var subTypesNames : [String]?
    //    var segueSubtypes : (()->())?
    var fatherView : wardrobeViewController?
    override func awakeFromNib() {
        super.awakeFromNib()
        subClassesCollecionView.delegate = self
        subClassesCollecionView.dataSource = self
        subClassesCollecionView.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        constraintCollectionViewHeight.constant = UIScreen.screenWidth*0.4//41
        
        
        
    }
    
}

extension SuperRoupaTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return thisSuperClothesArray?.count ?? 0
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let collectionCell = subClassesCollecionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FrontCollectionViewCell
        
        
        collectionCell.pictureOfSubType.image = thisSuperClothesArray?[indexPath.item].image?.toUIImage() ?? nil
        
        collectionCell.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0).cgColor
        collectionCell.layer.cornerRadius = 21
        
        
        collectionCell.backgroundColor = .white
        collectionCell.pictureOfSubType.backgroundColor = .white
        return collectionCell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lado = UIScreen.screenWidth*0.4
        return CGSize(width: lado , height: lado)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        let segue = segueSubtypes!
        fatherView!.performSegue(withIdentifier: "selectionOfSubtipe", sender: (superClassNameLabel.text, self.thisSuperClothesArray?[indexPath.item].subType))
        //        segue()
        
        
    }
    
    
    
}

