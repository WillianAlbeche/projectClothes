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
    
    var classeMock = MockClothesData()
    
    var allClothes: [Clothes]?
    var clotheTipesDict: [String: [Clothes]] = [:]
    var presentClothesSuperTypes : [String] = []
    
    var calculatedNumberOfCategories :Int?
    
    
    @IBAction func didSelectPicker(_ sender: UISegmentedControl) {
        
        categoriesTableView.isHidden = sender.selectedSegmentIndex != 0
        looksCollectionView.isHidden = sender.selectedSegmentIndex == 0
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        allClothes = classeMock.roupasMock
       
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
        let looksCollectionViewLayout = looksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        looksCollectionViewLayout?.sectionInset = UIEdgeInsets(top: 0.0 , left: UIScreen.screenWidth*0.072, bottom: 5, right: UIScreen.screenWidth*0.072)
           
        
        calculatedNumberOfCategories = getNumberSuperClothesCategories()
        
        
    }
    func getNumberSuperClothesCategories() -> Int{
       
        guard let unwrapedClothesArray = allClothes else{
            fatalError("no clothes to be received")
        }
         
        for clothe in unwrapedClothesArray{
            guard let currentClotheType = clothe.type else{
                print("somethingWrong with unwrapedClothesArray in wardrobeVC")
                continue
            }
            if  presentClothesSuperTypes.contains(currentClotheType) == false{
                presentClothesSuperTypes.append(currentClotheType)
                clotheTipesDict[currentClotheType] = [clothe]
                
            }else{
                // so da append no dict
                clotheTipesDict[currentClotheType]?.append(clothe)
            }
        }
        print(presentClothesSuperTypes.count)
    
        return presentClothesSuperTypes.count
     
    }
        
        
    
    
   
    
}


extension wardrobeViewController :  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculatedNumberOfCategories ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuperRoupaTableViewCell
        
        let name = presentClothesSuperTypes[indexPath.row]
        cell.superClassNameLabel.text = name
        cell.thisSuperClothesArray = clotheTipesDict[name]
        
        
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
        cell.clotheImage.image = UIImage(named: "Image2")
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
