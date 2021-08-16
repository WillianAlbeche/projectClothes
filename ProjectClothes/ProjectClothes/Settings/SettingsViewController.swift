//
//  SettingsViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 10/08/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var gender: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gender.forEach { $0.layer.cornerRadius = 5 }
    }
    
    @IBAction func selectedButton(_ sender: Any) {
        for button in gender {
            if button.tag == (sender as AnyObject).tag {
                button.backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                button.setTitleColor(UIColor.white, for:.normal)
            } else {
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor.black, for:.normal)
            }
        }
        
    }
    
    
    
}
