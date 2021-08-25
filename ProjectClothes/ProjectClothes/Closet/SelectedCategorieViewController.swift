//
//  selectedCategorieViewController.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 13/08/21.
//

import UIKit

class SelectedCategorieViewController: UIViewController {

    var isCreating : Bool = false
    
    @IBOutlet weak var filteredClothesCollectionView: UICollectionView!
    var segmentedClothes : [Clothes]?
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredClothesCollectionView.delegate = self
        filteredClothesCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        
        let layout = filteredClothesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.sectionInset =  UIEdgeInsets(top: 0.0 , left: UIScreen.screenWidth*0.072, bottom: 5, right: UIScreen.screenWidth*0.072)
        
        
        self.view.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        
        
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        let destination = segue.destination as? ClothesDetailsViewController
        guard let roupa = sender as? Clothes else{return}
        destination?.clothe = roupa
        destination?.isCreating = self.isCreating
        
        
        
    }
    
  
    
    
}
extension SelectedCategorieViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let numCells = segmentedClothes?.count ?? 0
        return numCells
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentedCellCollectionViewCell", for: indexPath) as? SegmentedCellCollectionViewCell, let  unwrapedSegmentedClothes = segmentedClothes else{
            return collectionView.dequeueReusableCell(withReuseIdentifier: "SegmentedCellCollectionViewCell", for: indexPath)
        }
        cell.segmentedImage.image = unwrapedSegmentedClothes[indexPath.row].image?.toUIImage()
        cell.segmentedImage.backgroundColor = .white
        cell.layer.cornerRadius = 21
        
        cell.backgroundColor = .white
       
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        performSegue(withIdentifier: "toClothesDetails", sender: segmentedClothes?[indexPath.item])
        
        
    }

}
extension SelectedCategorieViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  UIScreen.screenWidth*0.4, height: UIScreen.screenWidth*0.4)
    }
    
    
}
