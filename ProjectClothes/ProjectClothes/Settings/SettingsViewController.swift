//
//  SettingsViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 10/08/21.
//

import UIKit
enum genderButton: String {
    case female, male, none
    
}

class SettingsViewController: UIViewController {
    
    @IBOutlet var gender: [UIButton]!
    var selectedGender: [Bool] = [false, false, false]
    var selectedGenderbutton: [String] = ["female", "male", "none"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gender.forEach { $0.layer.cornerRadius = 5 }
        let savedGender = DatabaseManager.shared.loadGender()
        guard let genderOption = genderButton(rawValue: savedGender) else {
            genderOption = .none
            return
        }
        self.genderOption = genderOption
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(selectedGender)
        for index in gender{
            if selectedGender[index.tag] == true {
                index.backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                index.setTitleColor(UIColor.white, for:.normal)
            }
        }
    }
    
    @IBAction func selectedButton(_ sender: UIButton) {
        //        for button in gender {
        //            if button.tag == (sender as AnyObject).tag {
        //                button.backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
        //                button.setTitleColor(UIColor.white, for:.normal)
        //            } else {
        //                button.backgroundColor = UIColor.white
        //                button.setTitleColor(UIColor.black, for:.normal)
        //            }
        //        }
        switch sender.tag {
        case 0:
            genderOption = .female
        case 1:
            genderOption = .male
        case 2:
            genderOption = .none
            
        default: genderOption = .none
        }
    }
    
    var genderOption: genderButton? {
        didSet {
            resetAllGenderButtons()
            switch genderOption {
            case .female:
                if selectedGender[0] {
                    gender[0].backgroundColor = UIColor.white
                    gender[0].setTitleColor(UIColor.black, for:.normal)
                    selectedGender[0] = false
                } else {
                    gender[0].backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                    gender[0].setTitleColor(UIColor.white, for:.normal)
                    DatabaseManager.shared.storeGender(userGender: "female")
                    selectedGender[0] = true
                }
                
            case .male:
                if selectedGender[1] {
                    gender[1].backgroundColor = UIColor.white
                    gender[1].setTitleColor(UIColor.black, for:.normal)
                    selectedGender[1] = false
                } else {
                    gender[1].backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                    gender[1].setTitleColor(UIColor.white, for:.normal)
                    DatabaseManager.shared.storeGender(userGender: "male")
                    selectedGender[1] = true
                }
            case .none:
                if selectedGender[2] {
                    gender[2].backgroundColor = UIColor.white
                    gender[2].setTitleColor(UIColor.black, for:.normal)
                    selectedGender[2] = false
                } else {
                    gender[2].backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                    gender[2].setTitleColor(UIColor.white, for:.normal)
                    DatabaseManager.shared.storeGender(userGender: "none")
                    selectedGender[2] = true
                }
            default:
                if selectedGender[2] {
                    gender[2].backgroundColor = UIColor.white
                    gender[2].setTitleColor(UIColor.black, for:.normal)
                    selectedGender[2] = false
                } else {
                    gender[2].backgroundColor = UIColor(red: 118/255, green: 120/255, blue: 232/255, alpha: 1)
                    gender[2].setTitleColor(UIColor.white, for:.normal)
                    DatabaseManager.shared.storeGender(userGender: "none")
                    selectedGender[2] = true
                }
            }
        }
    }
    
    private func resetAllGenderButtons() {
        gender.forEach{
            $0.backgroundColor = UIColor.white
            $0.setTitleColor(UIColor.black, for:.normal)
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
