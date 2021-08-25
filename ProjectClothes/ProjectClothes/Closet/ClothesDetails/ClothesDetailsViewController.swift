//
//  ClothesDetailsViewController.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 19/08/21.
//

import UIKit

class ClothesDetailsViewController: UIViewController {

    @IBOutlet weak var clothePhoto: UIImageView!
    @IBOutlet weak var imageWidth: NSLayoutConstraint!
    @IBOutlet weak var imageHeight: NSLayoutConstraint!
    @IBOutlet weak var constraintImageUpper: NSLayoutConstraint!
    @IBOutlet weak var sizeOfLabelConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var collectionViewTrailling: NSLayoutConstraint!
    @IBOutlet weak var collectionViewLeading: NSLayoutConstraint!
    
    @IBOutlet weak var seasonsAndSpecialsCollectionView: UICollectionView!
    @IBOutlet weak var tagsCollectionView: UICollectionView!
    
    @IBOutlet weak var descriptiveSentenceLabel: UILabel!
    @IBOutlet weak var selectClotheToCreate: UIBarButtonItem!
    var clothe : Clothes?
    var seasonAndSpecialsArray : [String] = []
    
    var isCreating = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagsCollectionView.delegate = self
        tagsCollectionView.dataSource = self
        
        seasonsAndSpecialsCollectionView.delegate = self
        seasonsAndSpecialsCollectionView.dataSource = self
        
        self.view.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        constraintImageUpper.constant = UIScreen.screenHeight*0.027
        let ladoImagemCalculado = UIScreen.screenWidth*0.842
        imageWidth.constant = ladoImagemCalculado
        imageHeight.constant = ladoImagemCalculado
        sizeOfLabelConstraint.constant = ladoImagemCalculado
        clothePhoto.image = clothe?.image?.toUIImage()
        clothePhoto.layer.cornerRadius = 20
        clothePhoto.backgroundColor = .white
        
        clothePhoto.layer.shadowColor = UIColor.black.cgColor
        clothePhoto.layer.shadowRadius = 30
        clothePhoto.layer.shadowOpacity = 1
        clothePhoto.layer.shadowOffset = CGSize(width: 500, height: 500)
        clothePhoto.clipsToBounds = false
        
        collectionViewTrailling.constant = UIScreen.screenWidth*(1-0.842)/2
        collectionViewLeading.constant = UIScreen.screenWidth*(1-0.842)/2
        
        
        self.tagsCollectionView.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        self.seasonsAndSpecialsCollectionView.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
        if let layout = tagsCollectionView.collectionViewLayout as? AlignedCollectionViewFlowLayout {
            layout.minimumLineSpacing = 8
            layout.minimumInteritemSpacing = 8
            layout.horizontalAlignment = .left
            layout.verticalAlignment = .center
            
        }
        
        tagsCollectionView.showsVerticalScrollIndicator = false
        tagsCollectionView.showsHorizontalScrollIndicator = false
        seasonsAndSpecialsCollectionView.showsVerticalScrollIndicator = false
        seasonsAndSpecialsCollectionView.showsHorizontalScrollIndicator = false
        tagsCollectionView.clipsToBounds = false
        
        
        if let seasons = clothe?.seasons {
            seasonAndSpecialsArray += seasons
            
        }
        if let specials = clothe?.specials {
            seasonAndSpecialsArray += specials
            
        }
        
        descriptiveSentenceLabel.text = ""
        selectClotheToCreate.isEnabled = isCreating
//        selectClotheToCreate.customView?.isHidden = isCreating
        
        if !isCreating { selectClotheToCreate.title = nil}
        
        
    }
    @IBAction func exitModal(_ sender: Any) {
        performSegue(withIdentifier: "unWindModal", sender: nil)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "unWindModal"{
            guard let destination = segue.destination as? CreateViewController,
                              let clotheAux = clothe
                              else { return }
                        destination.createClothes(selectClothes: clotheAux)
            
        
        }
    }
    func getUIImage(seasonOrSpecial : String)-> UIImage?{
        var image : UIImage? = nil
        
        if seasonOrSpecial.lowercased() == "summer"{
            image = UIImage(systemName: "sun.max")
            
        }else if seasonOrSpecial.lowercased() == "winter"{
            image = UIImage(systemName: "snow")
            
        } else if seasonOrSpecial.lowercased() == "spring"{
            image = UIImage(systemName: "leaf")
            
        } else if seasonOrSpecial.lowercased() == "autumn"{
            image = UIImage(named: "autumn")
            
        } else if seasonOrSpecial.lowercased() == "wind"{
            image = UIImage(systemName: "wind")
            
        } else if seasonOrSpecial.lowercased() == "rain"{
            image = UIImage(systemName: "cloud.rain")
            
        } else if seasonOrSpecial.lowercased() == "sensitiveRain"{
            image = UIImage(systemName: "wind")
            
        } else { //if seasonOrSpecial.lowercased() == "snow"
            image = UIImage(named: "snow.")
            
        }
        
        return image
    }
    
    
    

}
extension ClothesDetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == tagsCollectionView{
        return clothe?.filters?.count ?? 0
        } else {
          let seasonsCount =  clothe?.seasons?.count ?? 0
            let specialsCount = clothe?.specials?.count ?? 0
            return seasonsCount + specialsCount
            
        }
        
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == tagsCollectionView{
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filtersCell", for: indexPath) as? TagClothesDetailsCollectionViewCell
        cell?.contentView.backgroundColor = .white
        cell?.currentFilter.text = clothe?.filters?[indexPath.item] ?? ""
        cell?.contentView.layer.cornerRadius = 5
        cell?.contentView.layer.masksToBounds = true
        
        
        
        cell?.layer.shadowColor = UIColor.black.cgColor
        cell?.layer.shadowRadius = 30
        cell?.layer.shadowOpacity = 0.1
        cell?.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        cell?.layer.masksToBounds = false
        
                
        return cell ?? UICollectionViewCell()
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "seasonAndSpecialsCell", for: indexPath) as? SeasonAndSpecialsCollectionViewCell
            
            let color = UIColor(red: 0.161, green: 0.243, blue: 0.463, alpha: 1)
            
            cell?.name.text = seasonAndSpecialsArray[indexPath.item]
            
            let imageAux = getUIImage(seasonOrSpecial: seasonAndSpecialsArray[indexPath.item])?.withTintColor(color, renderingMode: .alwaysOriginal)
            cell?.picture.image = imageAux
            cell?.picture.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
            cell?.contentView.backgroundColor = UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
            cell?.name.backgroundColor =  UIColor(red: 247/255, green: 248/255 , blue: 251/255, alpha: 1)
            return cell  ?? UICollectionViewCell()
            
        }
      
        
        
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
