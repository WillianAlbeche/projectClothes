//
//  WhiteBoardViewController.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 03/08/21.
//

import UIKit

class WhiteBoardViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    var imageReceive : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        //        navigationItem.backBarButtonItem?.image = UIImage(systemName: "chevron.backward")
        
        imageView.image = imageReceive
        
    }
    
    
    
}
