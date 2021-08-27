//
//  ViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 27/07/21.
//

import UIKit

class ViewController: UIViewController {
    var isSelectedGender: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func genderSelect(_ sender: UIButton){
        switch sender.tag {
        case 0: isSelectedGender = DatabaseManager.shared.storeGender(userGender: "Feminino")
            print(sender.tag)
        case 1: isSelectedGender = DatabaseManager.shared.storeGender(userGender: "Masculino")
            print(sender.tag)
        case 2: isSelectedGender = DatabaseManager.shared.storeGender(userGender: "Não binário")
            print(sender.tag)
        default: isSelectedGender = false
        }
        
        DatabaseManager.shared.onboardingDone(genderSave: isSelectedGender)
            
        
        performSegue(withIdentifier: "onboarding", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "onboarding" {
            let _ = segue.destination as? TabBarController
            
        }
    }
    
}

