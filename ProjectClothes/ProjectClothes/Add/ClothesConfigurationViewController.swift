//
//  ClothesConfigurationViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 04/08/21.
//

import UIKit

class ClothesConfigurationViewController: UIViewController, UIColorPickerViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var categoryButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var imageReceive: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newImage.image = imageReceive
        newImage.backgroundColor = .white
        newImage.layer.cornerRadius = 20
        newImage.layer.shadowColor = UIColor.gray.cgColor
        newImage.layer.shadowOpacity = 0.3
        newImage.layer.shadowOffset = .zero
        newImage.layer.shadowRadius = 18
        
        colorButton.backgroundColor = .white
        colorButton.layer.cornerRadius = 32
        colorButton.layer.shadowColor = UIColor.gray.cgColor
        colorButton.layer.shadowOpacity = 0.3
        colorButton.layer.shadowOffset = .zero
        colorButton.layer.shadowRadius = 30
        
        saveButton.frame.size = CGSize(width: 155, height: 64)
        saveButton.layer.cornerRadius = 32
        saveButton.layer.shadowColor = UIColor.gray.cgColor
        saveButton.layer.shadowOpacity = 0.3
        saveButton.layer.shadowOffset = .zero
        saveButton.layer.shadowRadius = 30
        
        categoryButton.backgroundColor = .white
        categoryButton.frame.size = CGSize(width: 155, height: 64)
        categoryButton.layer.cornerRadius = 32
        categoryButton.layer.shadowColor = UIColor.gray.cgColor
        categoryButton.layer.shadowOpacity = 0.3
        categoryButton.layer.shadowOffset = .zero
        categoryButton.layer.shadowRadius = 30
        
        nextButton.frame.size = CGSize(width: 155, height: 64)
        nextButton.layer.cornerRadius = 32
        nextButton.layer.shadowColor = UIColor.gray.cgColor
        nextButton.layer.shadowOpacity = 0.3
        nextButton.layer.shadowOffset = .zero
        nextButton.layer.shadowRadius = 30
    }
    
    
    @IBAction func colorButtonAction(_ sender: Any) {
        colorButton.addTarget(self, action: #selector(didTapSelector), for: .touchUpInside)
    }
    @objc private func didTapSelector(){
        let colorpickerVC = UIColorPickerViewController()
        colorpickerVC.delegate = self
        colorpickerVC.supportsAlpha = false
        colorpickerVC.modalPresentationStyle = .fullScreen
        present(colorpickerVC, animated: true)
    }
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
        let color = viewController.selectedColor
        colorButton.tintColor = color
        colorButton.titleLabel?.textColor = color
        colorButton.setTitle(" \(color.accessibilityName.capitalizingFirstLetter())", for: .normal)
    }
}
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
extension UIColor {
    //MARK: - HUE COLOR SELECTOR
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        red = red*255
        green = green*255
        blue = blue*255
        
        let x = CGFloat(round((100*red)/100))
        let y = CGFloat(round((100*green)/100))
        let z = CGFloat(round((100*blue)/100))
        
        return (x, y, z, alpha)
    }
}
