//
//  ShoesViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class ShoesViewController: UIViewController {
    
    var gender: String?

    @IBOutlet weak var shoe1Button: UIButton!
    @IBOutlet weak var shoe2Button: UIButton!
    @IBOutlet weak var shoe3Button: UIButton!
    @IBOutlet weak var shoe4Button: UIButton!
    @IBOutlet weak var shoe5Button: UIButton!
    @IBOutlet weak var shoe6Button: UIButton!
    @IBOutlet weak var shoe7Button: UIButton!
    @IBOutlet weak var shoe8Button: UIButton!
    @IBOutlet weak var shoe9Button: UIButton!
    @IBOutlet weak var shoe10Button: UIButton!
    @IBOutlet weak var othersButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shoe1Button.layer.cornerRadius = 20
        shoe2Button.layer.cornerRadius = 20
        shoe3Button.layer.cornerRadius = 20
        shoe4Button.layer.cornerRadius = 20
        shoe5Button.layer.cornerRadius = 20
        shoe6Button.layer.cornerRadius = 20
        shoe7Button.layer.cornerRadius = 20
        shoe8Button.layer.cornerRadius = 20
        shoe9Button.layer.cornerRadius = 20
        shoe10Button.layer.cornerRadius = 20
        othersButton.layer.cornerRadius = 20
        
        if gender == "M" {
            
            shoe5Button.isHidden = true
            shoe6Button.isHidden = true
            shoe7Button.isHidden = true
            shoe10Button.isHidden = true
            
        }
    }
    
//    override func updateViewConstraints() {
//        self.view.frame.origin.y = 350
//        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
//        super.updateViewConstraints()
//    }
    
}
