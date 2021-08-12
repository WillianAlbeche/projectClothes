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
    
    var thisSuperClothesArray : [Clothes]?
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        
    
        subClassesCollecionView.delegate = self
        subClassesCollecionView.dataSource = self
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension SuperRoupaTableViewCell : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
            print(thisSuperClothesArray!.count)
       
        
        return thisSuperClothesArray!.count
    }
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         let collectionCell = subClassesCollecionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! FrontCollectionViewCell
        
        collectionCell.layer.cornerRadius = 10
        print("aqui---------")
        print(thisSuperClothesArray?[indexPath.row].type)
        print(thisSuperClothesArray?[indexPath.row].image?.toUIImage())
        print("------------")
        collectionCell.pictureOfSubType.image = thisSuperClothesArray?[indexPath.row].image?.toUIImage()
        collectionCell.backgroundColor = .blue
        
            return collectionCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let lado = UIScreen.screenHeight*0.1859
        return CGSize(width: lado , height: lado)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selectioando ")
    }
    
    
    
}

