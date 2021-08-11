//
//  SettingsViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 10/08/21.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var UsoRoupas: [UIButton]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UsoRoupas.forEach { $0.layer.cornerRadius = 5 }
    }
    
    @IBAction func selectedButton(_ sender: Any) {
//        for button in UsoRoupas {
//            button.isTouchInside
//            if button. <= sender.tag {
//                button.setImage(UIImage.init(named: “star_selected”), for: .normal)
//            } else {
//                button.setImage(UIImage.init(named: “star_normal”), for: .normal)
//            }
//        }
        
    }
    
    
    
}
