//
//  ClothesConfigurationViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 04/08/21.
//

import UIKit
import CloudKit

class ClothesConfigurationViewController: UIViewController, UIColorPickerViewControllerDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
    }
    
    @IBOutlet weak var newImage: UIImageView!
    @IBOutlet weak var colorButton: UIButton!
    @IBOutlet weak var saveButton: UIButton!
    @IBAction func saveAction(_ sender: Any) {
        
        
        let mock = MockClothesData.init()
        
        guard let roupa = roupa else {return}
        print("iddidididi: \(roupa.id)")
        DatabaseManager.shared.createNewClothes(clothes: mock.roupa1) { error in
            if error == nil{
                print("create clothes save")
            }
        }
        print(roupa.color)
        print(roupa.type)
        print(roupa.subType)
        
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var categoryButton: UIButton!
    @IBAction func continuarButton(_ sender: UIButton) {
        performSegue(withIdentifier: "goToConfig", sender: gender)
    }
    
    
    @IBAction func categoryAction(_ sender: UIButton) {
        performSegue(withIdentifier: "goToModal", sender: gender)
    }
    @IBOutlet weak var nextButton: UIButton!
    
    var imageReceive: UIImage?
    var gender: String = "none" // nao binario
    var roupa : Clothes?
    var type: String?{
        didSet{
            guard let type = type else {return}
            roupa?.type = type.lowercased()
        }
    }
    var choice: String?{
        didSet{
            guard let choice = choice else {return}
            categoryButton.setTitle(choice, for: .normal)
            roupa?.subType = choice.lowercased()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        roupa = Clothes.createEmptyClothes()
//        gender = DatabaseManager.shared.loadGender().lowercased()
        guard let imageURL = imageReceive?.toURL() else {return}
        let auxImage = CKAsset.init(fileURL: imageURL)
        roupa?.image = auxImage
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
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConfig"{
            let destination = segue.destination as? ClothesConfigViewController
            destination?.roupa = roupa
            
        }
        
        if segue.identifier == "goToModal" {
            let destination = segue.destination as? MyCustomNavigationController
            let dest = destination?.topViewController as? ModalViewController
            dest?.gender1 = gender
        }
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
        roupa?.color = String("\(color.accessibilityName)").lowercased()
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
