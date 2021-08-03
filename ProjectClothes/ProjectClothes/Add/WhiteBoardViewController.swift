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
        navigationItem.backBarButtonItem?.image = UIImage(systemName: "chevron.backward")
        imageView.image = imageReceive
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
