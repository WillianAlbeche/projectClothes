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
    var allClothes: [Clothes]? = [] // array the clothes recebido ou do servidor, ou do core data, ou do mock de dados
    var allClothesNew: [Clothes]? = []
    var clotheTipesDict: [String: [Clothes]] = [:]// array filtrado pelo tipo : parte de cima, parte de baixo, calçado
    var clotheSuperTypesAndSubTypesDict : [String:[String:[Clothes]]] = [:] // isso aqui tem somente uma roupa de cada subtipo
    var presentClothesSuperTypes : [String] = [] //tipos(supertipos) presentes no array allclothes
    var filteredClothes : [Clothes]?
    var allLooks : [Look]? = []
    var calculatedNumberOfCategories :Int?
    
    var isloggedin: Bool = false
    
    var isCreating : Bool = false
    
    
    
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
        
        categoriesTableView.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        
        self.view.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        
        looksCollectionView.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        
        
//        allClothes = MockClothesData.roupasMock
//        allLooks = MockClothesData.looksMock
        
        
        
        setUpSearchController()
        
        
        
        let looksCollectionViewLayout = looksCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        looksCollectionViewLayout?.sectionInset = UIEdgeInsets(top: 0.0 , left: UIScreen.screenWidth*0.072, bottom: 5, right: UIScreen.screenWidth*0.072)
        
        
        self.calculatedNumberOfCategories = self.getNumberSuperClothesCategories()
        

        if  let thisNavigationController =  self.navigationController as? WardrobeNavigationController {
            
            self.isCreating = thisNavigationController.isCreating
        }
        
        
        
        
        
    }
    
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
    //        loadingPage.startAnimating()
            DatabaseManager.shared.checkiCloudAccount() { error, logged in
                if error == true {
                    if logged {
                        print("yes log")
                        DatabaseManager.shared.fetchAllClothes { result in
                            switch result {
                            case .failure(_):
                                print("wrong clothes")
                            case .success(let clothes):
                                self.allClothesNew = clothes
                                DispatchQueue.main.async {
                                    
                                    if self.allClothesNew != self.allClothes {
                                        print("DIFERENTE")
                                        self.allClothes = self.allClothesNew
                                    
                                    self.clotheTipesDict = [:]
                                    self.clotheSuperTypesAndSubTypesDict = [:]
                                    self.presentClothesSuperTypes = []
                                    self.filteredClothes = []
                                    
                                    
    
                                    self.calculatedNumberOfCategories = self.getNumberSuperClothesCategories()
    
                                    self.categoriesTableView.reloadData()
//                                        print(self.allClothes)
//                                        print(self.allClothesNew)
                                    }
                                }
                            }
                            
                        }
                    } else {
                        print("nolog")
                        DispatchQueue.main.async {
                            DatabaseManager.shared.loggingiCloud(vc: self)
                        }
                    }
                }
            }
            
        }
    
    override func viewWillAppear(_ animated: Bool) {
        self.categoriesTableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "selectionOfSubtipe"{
            let destination = segue.destination as? SelectedCategorieViewController
            if let senderTuple = sender as? (String, String) {
                let firstFromTuple = senderTuple.0.lowercased()
                let secondFromTuple = senderTuple.1.lowercased()
                destination?.segmentedClothes = clotheSuperTypesAndSubTypesDict[firstFromTuple]?[secondFromTuple]
                destination?.isCreating = self.isCreating

                
                
            }
        }
    }
    
    @IBAction func pickerAction(_ sender: Any) {
        if clotheOrLookPicker.selectedSegmentIndex == 1{
//            allLooks = MockClothesData.looksMock // remover depois
            looksCollectionView.reloadData()
        }
    }
    
    func getFirstItems(superType : String) -> [Clothes]{
        guard let subTypesDic = clotheSuperTypesAndSubTypesDict[superType] else{
            return []
            
        }
        var firstElements : [Clothes] = []
        for i in subTypesDic{
            
            firstElements.append(i.1.first! )// forced
        }
        
        return firstElements
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
            guard let currentClotheType = clothe.type, let  currentClotheSubType = clothe.subType else{
                print("somethingWrong with unwrapedClothesArray in wardrobeVC")
                continue
            }
            print("-------------")
            print(currentClotheType)
            
            
            if  presentClothesSuperTypes.contains(currentClotheType) == false{
                presentClothesSuperTypes.append(currentClotheType)
                clotheTipesDict[currentClotheType] = [clothe]
                
                if let currentSubType = clothe.subType{
                    clotheSuperTypesAndSubTypesDict[currentClotheType] = [currentSubType: [clothe]]
                }
                
            }else{
                // so da append no dict
                clotheTipesDict[currentClotheType]?.append(clothe)
                if let subDic = clotheSuperTypesAndSubTypesDict[currentClotheType]{
                    if subDic[currentClotheSubType] != nil {// se tem o subtype
                        clotheSuperTypesAndSubTypesDict[currentClotheType]?[currentClotheSubType]?.append(clothe)
                        
                    }else{
                        clotheSuperTypesAndSubTypesDict[currentClotheType]?[currentClotheSubType] = [clothe]
                        
                    }
                    
                }
                
            }
            
            
        }
        
        return presentClothesSuperTypes.count
        
    }
    
    
    
    
    
    
}


extension wardrobeViewController :  UITableViewDelegate, UITableViewDataSource{
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calculatedNumberOfCategories ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = categoriesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SuperRoupaTableViewCell
        let name = presentClothesSuperTypes[indexPath.row] // com esse nome pegar uma clothe de cada subtipo
        cell.superClassNameLabel.text = name.capitalizingFirstLetter()
        
        
        cell.thisSuperClothesArray = getFirstItems(superType: name)
        
        cell.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        
        cell.fatherView = self
        
        cell.subClassesCollecionView.reloadData()
        return  cell
    }
    
    
    
}
extension wardrobeViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {// fazer segue aqui também
        print("")
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let _ = viewsSearchController?.searchBar.text, let unwrappedFilteredClothes = filteredClothes,  viewsSearchController?.searchBar.text != "", clotheOrLookPicker.selectedSegmentIndex == 0 {// if a query is being made on clothes
            
            
            return unwrappedFilteredClothes.count
        }else{
            
            if clotheOrLookPicker.selectedSegmentIndex == 1 {
                return allLooks?.count ?? 0
            }
            else{ // querry isnt  being made and you are in the clothes section
                return 0
                
            }
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "hiddenCollectionCell", for: indexPath) as? BackCollectionViewCell else{
            return collectionView.dequeueReusableCell(withReuseIdentifier: "hiddenCollectionCell", for: indexPath)
            
        }
        if let _ = viewsSearchController?.searchBar.text, let unwrappedFilteredClothes = filteredClothes,  viewsSearchController?.searchBar.text != "" {
            // if a query is being made, basically
            
            
            let currentFilteredClothe = unwrappedFilteredClothes[indexPath.item]
            
            
            
            if clotheOrLookPicker.selectedSegmentIndex == 1 {//se está no looks
                cell.label.text = currentFilteredClothe.type //TEMPORARIO
                cell.clotheImage.image = UIImage(named: "Image2")
                //cell.configureWithlabel()
                cell.configureWithOutLabel()
                
                
                
            } else { // se está no clothes
                if indexPath.item < filteredClothes?.count ?? 0
                {
                    cell.clotheImage.image = filteredClothes?[indexPath.item].image?.toUIImage() ?? nil
                    cell.label.text = ""
//                    cell.label.removeFromSuperview()
                    
                } else {
                    cell.clotheImage.image = UIImage(named: "")
                }
                cell.configureWithOutLabel()
            }
        } else{// querry not being made
            
            if clotheOrLookPicker.selectedSegmentIndex == 1 {
                cell.clotheImage.image = allLooks?[indexPath.item].image?.toUIImage()
                
            
                //cell.configureWithlabel()
            
            }
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
//extension wardrobeViewController :
