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
    
    var maleClothes = ["Tênis", "Bota", "Sapatênis", "Oxford / Monk / Derby", "Outro", "Tênis", "Bota", "Sapatênis"]
    var femaleClothes = ["Tênis", "Bota", "Saltos", "Sapatilhas / Rasteiras", "Oxford", "Mules", "Mocassins", "Sandálias", "Scarpin", "Outro"]
    var none = ["Tênis", "Bota", "Sapatênis", "Oxford / Monk / Derby", "Saltos", "Sapatilhas / Rasteiras", "Mules", "Mocassins", "Sandálias", "Scarpin", "Outro"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewheigth.constant = UIScreen.main.bounds.height*0.35
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellShoesClothesTableViewCell
            
            let cellroupas = maleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
            
        }else if gender == "F" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellShoesClothesTableViewCell
            
            let cellroupas = femaleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else if gender == "NONE"{
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
    
}
