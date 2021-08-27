//
//  SettingsViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 10/08/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var gender: [UIButton]!
    var selectedGender: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gender.forEach { $0.layer.cornerRadius = 5 }
    }
    
    @IBAction func selectedButton(_ sender: UIButton) {
        for button in gender {
            if button.tag == (sender as AnyObject).tag {
                button.backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                button.setTitleColor(UIColor.white, for:.normal)
            } else {
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor.black, for:.normal)
            }
        }
        switch sender.tag {
        case 0: selectedGender = DatabaseManager.shared.storeGender(userGender: "female")
        case 1: selectedGender = DatabaseManager.shared.storeGender(userGender: "male")
        case 2: selectedGender = DatabaseManager.shared.storeGender(userGender: "none")
        default: selectedGender = DatabaseManager.shared.storeGender(userGender: "none")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "contato" {
            let destination = segue.destination as? UINavigationController
            let topDestination = destination?.topViewController as? ContactViewController
        }
    }
    
    @IBAction func contato(_ sender: Any) {
        performSegue(withIdentifier: "contato", sender: nil)
    }
}
