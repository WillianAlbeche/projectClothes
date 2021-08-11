//
//  wardrobeViewController.swift
//  Wardrobe
//
//  Created by Brenda Linck on 06/08/21.
//

import UIKit

class wardrobeViewController: UIViewController {
    
    
    
   
    @IBOutlet weak var looksCollectionView: UICollectionView!
    @IBOutlet weak var clotheOrLookPicker: UISegmentedControl!
    @IBOutlet weak var categoriesTableView: UITableView!
    
    @IBAction func didSelectPicker(_ sender: UISegmentedControl) {
        
        categoriesTableView.isHidden = sender.selectedSegmentIndex != 0
        looksCollectionView.isHidden = sender.selectedSegmentIndex == 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
       
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        looksCollectionView.delegate = self
        looksCollectionView.dataSource = self
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        navigationItem.title = "first"
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        
        navigationItem.searchController = searchController
        
    }
}
extension wardrobeViewController :  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SuperRoupaTableViewCell else{
            return categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        }
            cell.superClassNameLabel.text = "parte superior"
        
        return  cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("working")
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tamanho = UIScreen.screenHeight*0.2216
        return tamanho
    }
    
    
}
extension wardrobeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hiddenCollectionCell", for: indexPath) as? BackCollectionViewCell else{
            return collectionView.dequeueReusableCell(withReuseIdentifier: "hiddenCollectionCell", for: indexPath)
            
        }
        
        cell.backgroundColor = .blue
        cell.clotheImage.image = UIImage(named: "image2")
        cell.label.text = "roupa blue"

        return cell
    }
    
    
    
    
    
}
extension wardrobeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                return CGSize(width:  UIScreen.screenWidth*0.4, height: UIScreen.screenWidth*0.4)
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(30)
//    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(0)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return CGFloat(0)
//    }
  
}
extension wardrobeViewController : UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
       let query = searchController.searchBar.text ?? ""
        
        if query.isEmpty {
            
                categoriesTableView.isHidden = clotheOrLookPicker.selectedSegmentIndex != 0
                looksCollectionView.isHidden = clotheOrLookPicker.selectedSegmentIndex == 0

            
        }else{
            categoriesTableView.isHidden = true
            looksCollectionView.isHidden = false
            
            
        }
        
    }
    
}
extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.width
   static let screenHeight = UIScreen.main.bounds.height
   static let screenSize = UIScreen.main.bounds.size
}
