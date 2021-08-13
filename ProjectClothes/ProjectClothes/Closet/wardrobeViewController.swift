//
//  wardrobeViewController.swift
//  Wardrobe
//
//  Created by Brenda Linck on 06/08/21.
//

import UIKit

class wardrobeViewController: UIViewController {
    
    
    
    
    @IBOutlet weak var looksCollectionView: UICollectionView! // na verdade isso nao vai ser só de looks
    @IBOutlet weak var clotheOrLookPicker: UISegmentedControl!
    @IBOutlet weak var categoriesTableView: UITableView!
    
    var classeMock = MockClothesData()
    var viewsSearchController : UISearchController?
    var allClothes: [Clothes]? // array the clothes recebido ou do servidor, ou do core data, ou do mock de dados
    var clotheTipesDict: [String: [Clothes]] = [:]// array filtrado pelo tipo : parte de cima, parte de baixo, calçado
    var presentClothesSuperTypes : [String] = [] //tipos(supertipos) presentes no array allclothes
    var filteredClothes : [Clothes]?
    
    var calculatedNumberOfCategories :Int?
    
    
    
    
    @IBAction func didSelectPicker(_ sender: UISegmentedControl) {
        
        categoriesTableView.isHidden = sender.selectedSegmentIndex != 0
        looksCollectionView.isHidden = sender.selectedSegmentIndex == 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allClothes = classeMock.roupasMock//carregando os dados mock
        
        categoriesTableView.delegate = self
        categoriesTableView.dataSource = self
        looksCollectionView.delegate = self
        looksCollectionView.dataSource = self
        categoriesTableView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        self.view.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        looksCollectionView.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        
        
        
        navigationItem.title = "first"
        
        
        setUpSearchController()
        
        
        
        let looksCollectionViewLayout = looksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        looksCollectionViewLayout?.sectionInset = UIEdgeInsets(top: 0.0 , left: UIScreen.screenWidth*0.072, bottom: 5, right: UIScreen.screenWidth*0.072)
        
        
        calculatedNumberOfCategories = getNumberSuperClothesCategories()
    }
    
    func setUpSearchController(){
        
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        viewsSearchController = searchController
        
        
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
        cell.backgroundColor = UIColor(red: 0.898, green: 0.898, blue: 0.898, alpha: 1)
        cell.superClassNameLabel.text = name
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        <#code#>
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let _ = viewsSearchController?.searchBar.text, let unwrappedFilteredClothes = filteredClothes,  viewsSearchController?.searchBar.text != "" {
            return unwrappedFilteredClothes.count
            
            
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hiddenCollectionCell", for: indexPath) as? BackCollectionViewCell else{
            return collectionView.dequeueReusableCell(withReuseIdentifier: "hiddenCollectionCell", for: indexPath)
            
        }
        if let _ = viewsSearchController?.searchBar.text, let unwrappedFilteredClothes = filteredClothes,  viewsSearchController?.searchBar.text != "" {
            // if a query is being made, basically
            
            let currentFilteredClothe = unwrappedFilteredClothes[indexPath.row]
            
            
            cell.clotheImage.image = UIImage(named: "Image2")
            cell.label.text = currentFilteredClothe.type //TEMPORARIO !!!!!!!!
            
            
        }else{
            // here I should just load the looks normally, since a query isnt being made
            
            
            cell.clotheImage.image = UIImage(named: "Image2")
            cell.label.text = "roupa blue"
            
            
            
        }
        cell.layer.cornerRadius = 25
        cell.backgroundColor = .white
        
        return cell
        
    }
    
    
    
    
    
}
extension wardrobeViewController : UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:  UIScreen.screenWidth*0.4, height: UIScreen.screenWidth*0.4)
    }
    
    
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
            
            filteredClothes = allClothes?.filter{ clothe in
                
                
                
                return isInQuery(clothe: clothe, query: query)
            }
            
        }
        looksCollectionView.reloadData()
    }
    func isInQuery(clothe: Clothes, query: String)->Bool{
        let arrayOfQueriesAux = query.words
        var arrayOfQueries : [String] = []
        arrayOfQueriesAux.forEach{ palavra in
            arrayOfQueries.append(String(palavra))
        }
        for tag in arrayOfQueries{
            if clotheHasTag(clothe: clothe, tag: tag) == true {
                return true
            }
        }
        return false
    }
    func clotheHasTag(clothe: Clothes, tag: String) ->Bool{
        
        guard let provisorio = (clothe.type?.lowercased().contains(tag.lowercased()))
        else{// provisorio !!!!
            return false
        }
        return provisorio   // ta dando merda aqui
    }
    
    
    
}
extension UIScreen{
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    static let screenSize = UIScreen.main.bounds.size
}


extension StringProtocol {
    var words: [SubSequence] {
        return split { !$0.isLetter }
    }
}
