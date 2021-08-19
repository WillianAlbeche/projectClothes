//
//  FullSizeClothesViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class FullSizeClothesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewheigth: NSLayoutConstraint!
    
    var gender: String?
    var choice: String?
    
    var maleClothes = ["Macacão"]
    var femaleClothes = ["Macacão", "Vestido"]
    var none = ["Macacão", "Vestido"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewheigth.constant = UIScreen.main.bounds.height*0.38
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "ligthPurple")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if gender == "M" {
            
            let numberOfClothes = maleClothes
            return numberOfClothes.count
            
        }else{
            
            let numberOfClothes = femaleClothes
            return numberOfClothes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if gender == "M"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellFullClothesTableViewCell
            
            let cellroupas = maleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
            
        }else if gender == "F" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellFullClothesTableViewCell
            
            let cellroupas = femaleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else if gender == "NONE"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellFullClothesTableViewCell
            
            let cellroupas = none[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellFullClothesTableViewCell
            
            let cellroupas = none[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        
        if gender == "M" {
            
            let array = maleClothes
            choice = array[indexPath.row]
            performSegue(withIdentifier: "goBack", sender: self)
            
        }else if gender == "F" {
            
            let array = femaleClothes
            choice = array[indexPath.row]
            performSegue(withIdentifier: "goBack", sender: self)
            
        }else if gender == "NONE"{
            
            let array = none
            choice = array[indexPath.row]
            performSegue(withIdentifier: "goBack", sender: self)
            
        }else{
            let array = none
            choice = array[indexPath.row]
            performSegue(withIdentifier: "goBack", sender: self)
            
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? ClothesConfigurationViewController
        
        if segue.identifier == "goBack" {
            destination?.choice = choice
        }
    }
    
}

