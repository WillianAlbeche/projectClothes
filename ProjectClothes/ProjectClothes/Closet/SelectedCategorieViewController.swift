//
//  selectedCategorieViewController.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 13/08/21.
//

import UIKit

class SelectedCategorieViewController: UIViewController {

    
    
    @IBOutlet weak var filteredClothesCollectionView: UICollectionView!
    var segmentedClothes : [Clothes]?
    override func viewDidLoad() {
        super.viewDidLoad()
        filteredClothesCollectionView.delegate = self
        filteredClothesCollectionView.dataSource = self
        // Do any additional setup after loading the view.
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
        
        return cell
    }
    

}
