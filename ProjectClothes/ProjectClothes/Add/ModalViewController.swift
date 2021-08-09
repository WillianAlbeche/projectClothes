//
//  ModalViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 09/08/21.
//

import UIKit

class ModalViewController: UIViewController {
    
    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButtonAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func updateViewConstraints() {
        
        self.view.frame.origin.y = 300
        self.view.roundCorners(corners: [.topLeft, .topRight], radius: 20.0)
        super.updateViewConstraints()
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
