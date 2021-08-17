//
//  ModalViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class MyCustomNavigationController: UINavigationController {
    override func updateViewConstraints() {
        super.updateViewConstraints()
        self.view.frame.origin.y = self.view.bounds.height/2.2
        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationBar.shadowImage = UIImage()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .clear
    }
    
}

class ModalViewController: UIViewController {
    
    @IBOutlet weak var fullSizeClothesButton: UIButton!
    @IBAction func fullSizeAction(_ sender: Any) {
        performSegue(withIdentifier: "goToFullSize", sender: gender1)
    }
    @IBOutlet weak var topPieceButton: UIButton!
    @IBAction func topPieceAction(_ sender: Any) {
        performSegue(withIdentifier: "goToTop", sender: gender1)
    }
    @IBOutlet weak var bottomPiceButton: UIButton!
    @IBAction func bottomPieceAction(_ sender: Any) {
        performSegue(withIdentifier: "goToBottom", sender: gender1)
    }
    @IBOutlet weak var shoebutton: UIButton!
    @IBAction func shoesAction(_ sender: Any) {
        performSegue(withIdentifier: "goToShoes", sender: gender1)
    }
    @IBOutlet weak var accessoriesButton: UIButton!
    @IBAction func accessoriesAction(_ sender: Any) {
        performSegue(withIdentifier: "goToAccessories", sender: gender1)
    }
    
    var gender1: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fullSizeClothesButton.layer.cornerRadius = 20
        topPieceButton.layer.cornerRadius = 20
        bottomPiceButton.layer.cornerRadius = 20
        shoebutton.layer.cornerRadius = 20
        accessoriesButton.layer.cornerRadius = 20
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as? FullSizeClothesViewController
        let destination2 = segue.destination as? ShoesViewController
        
        if segue.identifier == "goToFullSize" {
            destination?.gender = gender1
        }else if segue.identifier == "goToTop"{
            destination2?.gender = gender1
        }else if segue.identifier == "goToBottom"{
            destination2?.gender = gender1
        }else if segue.identifier == "goToShoes"{
            destination2?.gender = gender1
        }else if segue.identifier == "goToAccessories"{
            destination2?.gender = gender1
        }
    }
    
}

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
