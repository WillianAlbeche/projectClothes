//
//  ShoesViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class ShoesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var tableViewheigth: NSLayoutConstraint!
    
    var gender: String?
    var choice: String?
    
    var maleClothes = ["Tênis", "Bota", "Sapatênis", "Oxford", "Monk", "Derby", "Outro"]
    var femaleClothes = ["Tênis", "Bota", "Saltos", "Sapatilhas / Rasteiras", "Oxford", "Mules", "Mocassins", "Sandálias", "Scarpin", "Outro"]
    var none = ["Tênis", "Bota", "Sapatênis", "Oxford", "Monk", "Derby", "Saltos", "Sapatilhas / Rasteiras", "Mules", "Mocassins", "Sandálias", "Scarpin", "Outro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewheigth.constant = UIScreen.main.bounds.height*0.38
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = UIColor(named: "ligthPurple")
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if gender == "male" {
            
            let numberOfClothes = maleClothes
            return numberOfClothes.count
            
        }else if gender == "female"{
            
            let numberOfClothes = femaleClothes
            return numberOfClothes.count
            
        }else if gender == "none"{
            let numberOfClothes = none
            return numberOfClothes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        if gender == "male"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellShoesClothesTableViewCell
            
            let cellroupas = maleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
            
        }else if gender == "female" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellShoesClothesTableViewCell
            
            let cellroupas = femaleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else if gender == "none"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellShoesClothesTableViewCell
            
            let cellroupas = none[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellShoesClothesTableViewCell
            
            let cellroupas = none[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)  {
        
        if gender == "male" {
            
            let array = maleClothes
            choice = array[indexPath.row]
            performSegue(withIdentifier: "goBack", sender: self)
            
        }else if gender == "female" {
            
            let array = femaleClothes
            choice = array[indexPath.row]
            performSegue(withIdentifier: "goBack", sender: self)
            
        }else if gender == "none"{
            
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
