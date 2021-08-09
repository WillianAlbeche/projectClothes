//
//  FullSizeClothesViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class FullSizeClothesViewController: UIViewController {
    
    var gender: String?

    @IBOutlet weak var fullSize1Button: UIButton!
    @IBOutlet weak var fullSize2Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fullSize1Button.layer.cornerRadius = 20
        fullSize2Button.layer.cornerRadius = 20
        
        if gender == "M"{
            fullSize2Button.isHidden = true
        }else{
            
        }
        
        
    }
    
//    override func updateViewConstraints() {
//        self.view.frame.origin.y = 350
//        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
//        super.updateViewConstraints()
//    }
    
}

