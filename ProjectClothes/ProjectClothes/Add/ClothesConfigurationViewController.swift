//
//  ClothesConfigurationViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 04/08/21.
//

import UIKit

class ClothesConfigurationViewController: UIViewController {

    @IBOutlet weak var newImage: UIImageView!
    var imageReceive: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newImage.image = imageReceive
    }
}
