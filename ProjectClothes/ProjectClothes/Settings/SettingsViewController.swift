//
//  SettingsViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 10/08/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var usoRoupas: [UIButton]!
    @IBOutlet var season: [UIButton]!
    @IBOutlet var gender: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usoRoupas.forEach { $0.layer.cornerRadius = 5 }
        season.forEach { $0.layer.cornerRadius = 5 }
        gender.forEach { $0.layer.cornerRadius = 5 }
        
    }
    
    @IBAction func buttonsUsoRoupas(_ sender: Any) {
        for button in usoRoupas {
            if button.tag == (sender as AnyObject).tag {
                button.backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                button.setTitleColor(UIColor.white, for:.normal)
            } else {
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor.black, for:.normal)
            }
        }
    }
    
    @IBAction func buttonsSeason(_ sender: Any) {
        for button in season {
            if button.tag == (sender as AnyObject).tag {
                button.backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                button.setTitleColor(UIColor.white, for:.normal)
            } else {
                button.backgroundColor = UIColor.white
                button.setTitleColor(UIColor.black, for:.normal)
            }
        }
    }
    
    @IBAction func buttonGender(_ sender: Any) {
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
