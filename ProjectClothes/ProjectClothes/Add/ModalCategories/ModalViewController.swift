//
//  ModalViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var fullSizeClothesButton: UIButton!
    @IBAction func fullSizeAction(_ sender: Any) {
        performSegue(withIdentifier: "goToFullSize", sender: gender)
    }
    @IBOutlet weak var topPieceButton: UIButton!
    @IBOutlet weak var bottomPiceButton: UIButton!
    @IBOutlet weak var shoebutton: UIButton!
    @IBAction func shoesAction(_ sender: Any) {
        performSegue(withIdentifier: "goToShoes", sender: gender)
    }
    @IBOutlet weak var accessoriesButton: UIButton!
    
    var gender: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullSizeClothesButton.layer.cornerRadius = 20
        topPieceButton.layer.cornerRadius = 20
        bottomPiceButton.layer.cornerRadius = 20
        shoebutton.layer.cornerRadius = 20
        accessoriesButton.layer.cornerRadius = 20
    }
    
//    override func updateViewConstraints() {
//
//        self.view.frame.origin.y = 400
//        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
//        super.updateViewConstraints()
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? FullSizeClothesViewController
        let destination2 = segue.destination as? ShoesViewController
        
        if segue.identifier == "goToFullSize" {
            destination?.gender = gender
        }else if segue.identifier == "goToShoes"{
            destination2?.gender = gender
        }
    }
    
}
//extension UIView {
//    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
//        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        layer.mask = mask
//    }
//}
