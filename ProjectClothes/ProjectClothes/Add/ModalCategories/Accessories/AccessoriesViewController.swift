//
//  AccessoriesViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 12/08/21.
//

import UIKit

class AccessoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var gender: String?
    
    var maleClothes = ["Colar" , "Brinco"]
    var femaleClothes = ["Colar" , "Brinco"]
    var none = ["Colar" , "Brinco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellAccessoriesClothesTableViewCell
            
            let cellroupas = maleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
            
        }else if gender == "F" {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellAccessoriesClothesTableViewCell
            
            let cellroupas = femaleClothes[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else if gender == "NONE"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellAccessoriesClothesTableViewCell
            
            let cellroupas = none[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell1", for: indexPath) as! CustomCellAccessoriesClothesTableViewCell
            
            let cellroupas = none[indexPath.row]
            
            cell.clothesLabel.text = cellroupas
            cell.clothesLabel.layer.masksToBounds = true
            cell.clothesLabel.layer.cornerRadius = 20
            
            return cell
        }
    }
    
}