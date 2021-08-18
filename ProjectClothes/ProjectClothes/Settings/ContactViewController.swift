//
//  ContactViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 16/08/21.
//

import UIKit

class ContactViewController: UIViewController {
    
    @IBOutlet weak var emailTextLabel: UILabel!
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextLabel?.layer.cornerRadius = 15
        emailTextLabel.layer.masksToBounds = true
        let tappedGesture = UITapGestureRecognizer(target: self, action: #selector(clicked))
        emailTextLabel.isUserInteractionEnabled = true
        emailTextLabel.addGestureRecognizer(tappedGesture)
    }
    
    @objc func clicked() {
        UIPasteboard.general.string = emailTextLabel.text
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.navigationController?.dismiss(animated: true)
    }
}
