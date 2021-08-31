//
//  ClothesConfigViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 12/08/21.
//

import UIKit
import CloudKit

//enum CategoryOption {
//    case casual, formal, camping, trabalho, praia, ferias, esportes, festa, encontro
//}

class ClothesConfigViewController: UIViewController {
    
    @IBOutlet weak var viewHeigth: NSLayoutConstraint!
    
    
    var roupa : Clothes?
    
    var flags = [false, false, false, false, false, false, false, false, false]
    var filterList = ["casual", "formal","camping", "work", "beach", "vacations", "sports", "party", "date"]
    var emptyArray = [String]()
    
    var flags2 = [false, false, false, false]
    var filterList2 = ["autumn", "winter","spring", "summer"]
    var emptyArray2 = [String]()
    
    var flags3 = [false, false, false, false]
    var filterList3 = ["wind", "rain","snow", "sensitiveRain"]
    var emptyArray3 = [String]()
    
    //Tags Sections
    @IBAction func filtroSections(_ sender: UIButton) {
        switch sender.tag {
        case 0: if !flags[sender.tag] {
            casualOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            casualOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 1: if !flags[sender.tag] {
            formalOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            formalOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 2: if !flags[sender.tag] {
            campingOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            campingOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 3: if !flags[sender.tag] {
            workOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            workOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 4: if !flags[sender.tag] {
            beachOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            beachOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 5: if !flags[sender.tag] {
            vacationsOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            vacationsOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 6: if !flags[sender.tag] {
            sportsOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            sportsOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 7: if !flags[sender.tag] {
            partyOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            partyOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        case 8: if !flags[sender.tag] {
            dateOption.backgroundColor = UIColor(named: "lightPurple")
            flags[sender.tag] = true
        }else{
            dateOption.backgroundColor = .white
            flags[sender.tag] = false
        }
        default:
            break
        }
    }
    //Options
    @IBOutlet weak var casualOption: UIButton!
    @IBOutlet weak var formalOption: UIButton!
    @IBOutlet weak var campingOption: UIButton!
    @IBOutlet weak var workOption: UIButton!
    @IBOutlet weak var beachOption: UIButton!
    @IBOutlet weak var vacationsOption: UIButton!
    @IBOutlet weak var sportsOption: UIButton!
    @IBOutlet weak var partyOption: UIButton!
    @IBOutlet weak var dateOption: UIButton!
    @IBOutlet weak var newOption: UIButton!
    
    //Stack Estação
    @IBAction func filtroSeason(_ sender: UIButton) {
        switch sender.tag {
        case 0: if !flags2[sender.tag] {
            autumnOption.backgroundColor = UIColor(named: "lightPurple")
            flags2[sender.tag] = true
        }else{
            autumnOption.backgroundColor = .white
            flags2[sender.tag] = false
        }
        case 1: if !flags2[sender.tag] {
            winterOption.backgroundColor = UIColor(named: "lightPurple")
            flags2[sender.tag] = true
        }else{
            winterOption.backgroundColor = .white
            flags2[sender.tag] = false
        }
        case 2: if !flags2[sender.tag] {
            springOption.backgroundColor = UIColor(named: "lightPurple")
            flags2[sender.tag] = true
        }else{
            springOption.backgroundColor = .white
            flags2[sender.tag] = false
        }
        case 3: if !flags2[sender.tag] {
            summerOption.backgroundColor = UIColor(named: "lightPurple")
            flags2[sender.tag] = true
        }else{
            summerOption.backgroundColor = .white
            flags2[sender.tag] = false
        }
        default:
            break
        }
    }
    @IBOutlet weak var autumnOption: UIButton!
    @IBOutlet weak var winterOption: UIButton!
    @IBOutlet weak var springOption: UIButton!
    @IBOutlet weak var summerOption: UIButton!
    
    //Stack Especiais
    @IBAction func filtroSpecial(_ sender: UIButton){
        switch sender.tag {
        case 0: if !flags3[sender.tag] {
            windOption.backgroundColor = UIColor(named: "lightPurple")
            flags3[sender.tag] = true
        }else{
            windOption.backgroundColor = .white
            flags3[sender.tag] = false
        }
        case 1: if !flags3[sender.tag] {
            rainOption.backgroundColor = UIColor(named: "lightPurple")
            flags3[sender.tag] = true
        }else{
            rainOption.backgroundColor = .white
            flags3[sender.tag] = false
        }
        case 2: if !flags3[sender.tag] {
            snowOption.backgroundColor = UIColor(named: "lightPurple")
            flags3[sender.tag] = true
        }else{
            snowOption.backgroundColor = .white
            flags3[sender.tag] = false
        }
        case 3: if !flags3[sender.tag] {
            sensitiveRainOption.backgroundColor = UIColor(named: "lightPurple")
            flags3[sender.tag] = true
        }else{
            sensitiveRainOption.backgroundColor = .white
            flags3[sender.tag] = false
        }
        default:
            break
        }
    }
    @IBOutlet weak var windOption: UIButton!
    @IBOutlet weak var rainOption: UIButton!
    @IBOutlet weak var snowOption: UIButton!
    @IBOutlet weak var sensitiveRainOption: UIButton!
    
    @IBOutlet weak var addBrand: UIButton!
    @IBOutlet weak var addCloth: UIButton!
    @IBAction func addBrandFabricAction(_ sender: UIButton) {
        if sender.tag == 0{
            let ac = UIAlertController(title: "Enter the Brand", message: nil, preferredStyle: .alert)
            ac.addTextField()
            
            let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
                let answer = ac.textFields![0]
                // do something interesting with "answer" here
                self.roupa?.brand = answer.text?.lowercased()
            }
            ac.addAction(submitAction)
            present(ac, animated: true)
        }else{
            let ac = UIAlertController(title: "Enter the Fabric", message: nil, preferredStyle: .alert)
            ac.addTextField()
            
            let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
                let answer = ac.textFields![0]
                // do something interesting with "answer" here
                self.roupa?.fabric = answer.text?.lowercased()
            }
            ac.addAction(submitAction)
            present(ac, animated: true)
        }
    }
    
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonAction(_ sender: Any) {
        
        let indice = flags.enumerated().filter({ $0.element == true }).map({ $0.offset })
        for i in indice {emptyArray.append(filterList[i])}
        roupa?.filters = emptyArray
        print(roupa?.filters)
        
        var indice2 = flags2.enumerated().filter({ $0.element == true }).map({ $0.offset })
        for i in indice2 {emptyArray2.append(filterList2[i])}
        roupa?.seasons = emptyArray2
        print(roupa?.seasons)
        
        var indice3 = flags3.enumerated().filter({ $0.element == true }).map({ $0.offset })
        for i in indice3 {emptyArray3.append(filterList3[i])}
        roupa?.specials = emptyArray3
        print(roupa?.specials)
        
        guard let roupa = roupa else {return}
        print("roupa image: \(roupa.image)")
        DatabaseManager.shared.createNewClothes(clothes:roupa) { error in
            if error == nil{
                print("concluir")
//                let ac = UIAlertController(title: "Clothes", message: "Clothes Saved", preferredStyle: .alert)
//                ac.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            }
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    //Slider
    @IBOutlet weak var appSlider: UISlider!
    @IBOutlet weak var showSliderValue: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        
        let option1 = "Roupa leve, ideal para dias bem quentes"
        let option2 = "Boa peça para climas amenos"
        let option3 = "Peça quente! Uso nos dias agradavelmente frios"
        let option4 = "Peça bem quente! Ideal para um rigoroso inverno"
        
        if self.appSlider.value < 0.25{
            appSlider.minimumTrackTintColor = UIColor(named: "color1")
            appSlider.setThumbImage(UIImage(named: "circle1"), for: .normal)
            showSliderValue.text = option1
            
        }else if self.appSlider.value >= 0.25 && self.appSlider.value < 0.5 {
            appSlider.minimumTrackTintColor = UIColor(named: "color2")
            appSlider.setThumbImage(UIImage(named: "circle2"), for: .normal)
            showSliderValue.text = option2
            
        }else if self.appSlider.value >= 0.5 && self.appSlider.value < 0.75{
            appSlider.minimumTrackTintColor = UIColor(named: "color3")
            appSlider.setThumbImage(UIImage(named: "circle3"), for: .normal)
            showSliderValue.text = option3
            
        }else if self.appSlider.value > 0.75{
            appSlider.minimumTrackTintColor = UIColor(named: "color4")
            appSlider.setThumbImage(UIImage(named: "circle4"), for: .normal)
            showSliderValue.text = option4
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        
        
        viewHeigth.constant = UIScreen.main.bounds.height*0.2
        
        self.title = roupa?.subType != nil ? roupa?.subType : ""
        
        appSlider.minimumTrackTintColor = UIColor(named: "color1")
        appSlider.maximumTrackTintColor = .white
        appSlider.setThumbImage(UIImage(named: "circle1"), for: .normal)
        appSlider.layer.shadowColor = UIColor.gray.cgColor
        appSlider.layer.shadowOpacity = 0.3
        appSlider.layer.shadowOffset = .zero
        appSlider.layer.shadowRadius = 18
        
        casualOption.layer.cornerRadius = 20
        casualOption.backgroundColor = .white
        casualOption.layer.shadowColor = UIColor.gray.cgColor
        casualOption.layer.shadowOpacity = 0.3
        casualOption.layer.shadowOffset = .zero
        casualOption.layer.shadowRadius = 18
        
        formalOption.layer.cornerRadius = 20
        formalOption.backgroundColor = .white
        formalOption.layer.shadowColor = UIColor.gray.cgColor
        formalOption.layer.shadowOpacity = 0.3
        formalOption.layer.shadowOffset = .zero
        formalOption.layer.shadowRadius = 18
        
        campingOption.layer.cornerRadius = 20
        campingOption.backgroundColor = .white
        campingOption.layer.shadowColor = UIColor.gray.cgColor
        campingOption.layer.shadowOpacity = 0.3
        campingOption.layer.shadowOffset = .zero
        campingOption.layer.shadowRadius = 18
        
        workOption.layer.cornerRadius = 20
        workOption.backgroundColor = .white
        workOption.layer.shadowColor = UIColor.gray.cgColor
        workOption.layer.shadowOpacity = 0.3
        workOption.layer.shadowOffset = .zero
        workOption.layer.shadowRadius = 18
        
        beachOption.layer.cornerRadius = 20
        beachOption.backgroundColor = .white
        beachOption.layer.shadowColor = UIColor.gray.cgColor
        beachOption.layer.shadowOpacity = 0.3
        beachOption.layer.shadowOffset = .zero
        beachOption.layer.shadowRadius = 18
        
        vacationsOption.layer.cornerRadius = 20
        vacationsOption.backgroundColor = .white
        vacationsOption.layer.shadowColor = UIColor.gray.cgColor
        vacationsOption.layer.shadowOpacity = 0.3
        vacationsOption.layer.shadowOffset = .zero
        vacationsOption.layer.shadowRadius = 18
        
        sportsOption.layer.cornerRadius = 20
        sportsOption.backgroundColor = .white
        sportsOption.layer.shadowColor = UIColor.gray.cgColor
        sportsOption.layer.shadowOpacity = 0.3
        sportsOption.layer.shadowOffset = .zero
        sportsOption.layer.shadowRadius = 18
        
        partyOption.layer.cornerRadius = 20
        partyOption.backgroundColor = .white
        partyOption.layer.shadowColor = UIColor.gray.cgColor
        partyOption.layer.shadowOpacity = 0.3
        partyOption.layer.shadowOffset = .zero
        partyOption.layer.shadowRadius = 18
        
        dateOption.layer.cornerRadius = 20
        dateOption.backgroundColor = .white
        dateOption.layer.shadowColor = UIColor.gray.cgColor
        dateOption.layer.shadowOpacity = 0.3
        dateOption.layer.shadowOffset = .zero
        dateOption.layer.shadowRadius = 18
        
        newOption.layer.cornerRadius = 20
        newOption.backgroundColor = .white
        newOption.layer.shadowColor = UIColor.gray.cgColor
        newOption.layer.shadowOpacity = 0.3
        newOption.layer.shadowOffset = .zero
        newOption.layer.shadowRadius = 18
        
        autumnOption.layer.cornerRadius = 10
        autumnOption.backgroundColor = .white
        autumnOption.layer.shadowColor = UIColor.gray.cgColor
        autumnOption.layer.shadowOpacity = 0.3
        autumnOption.layer.shadowOffset = .zero
        autumnOption.layer.shadowRadius = 10
        
        winterOption.layer.cornerRadius = 10
        winterOption.backgroundColor = .white
        winterOption.layer.shadowColor = UIColor.gray.cgColor
        winterOption.layer.shadowOpacity = 0.3
        winterOption.layer.shadowOffset = .zero
        winterOption.layer.shadowRadius = 10
        
        springOption.layer.cornerRadius = 10
        springOption.backgroundColor = .white
        springOption.layer.shadowColor = UIColor.gray.cgColor
        springOption.layer.shadowOpacity = 0.3
        springOption.layer.shadowOffset = .zero
        springOption.layer.shadowRadius = 10
        
        summerOption.layer.cornerRadius = 10
        summerOption.backgroundColor = .white
        summerOption.layer.shadowColor = UIColor.gray.cgColor
        summerOption.layer.shadowOpacity = 0.3
        summerOption.layer.shadowOffset = .zero
        summerOption.layer.shadowRadius = 10
        
        
        windOption.layer.cornerRadius = 10
        windOption.backgroundColor = .white
        windOption.layer.shadowColor = UIColor.gray.cgColor
        windOption.layer.shadowOpacity = 0.3
        windOption.layer.shadowOffset = .zero
        windOption.layer.shadowRadius = 10
        
        rainOption.layer.cornerRadius = 10
        rainOption.backgroundColor = .white
        rainOption.layer.shadowColor = UIColor.gray.cgColor
        rainOption.layer.shadowOpacity = 0.3
        rainOption.layer.shadowOffset = .zero
        rainOption.layer.shadowRadius = 10
        
        snowOption.layer.cornerRadius = 10
        snowOption.backgroundColor = .white
        snowOption.layer.shadowColor = UIColor.gray.cgColor
        snowOption.layer.shadowOpacity = 0.3
        snowOption.layer.shadowOffset = .zero
        snowOption.layer.shadowRadius = 10
        
        sensitiveRainOption.layer.cornerRadius = 10
        sensitiveRainOption.backgroundColor = .white
        sensitiveRainOption.layer.shadowColor = UIColor.gray.cgColor
        sensitiveRainOption.layer.shadowOpacity = 0.3
        sensitiveRainOption.layer.shadowOffset = .zero
        sensitiveRainOption.layer.shadowRadius = 10
        
        addBrand.layer.cornerRadius = 20
        addBrand.backgroundColor = .white
        addBrand.layer.shadowColor = UIColor.gray.cgColor
        addBrand.layer.shadowOpacity = 0.4
        addBrand.layer.shadowOffset = .zero
        addBrand.layer.shadowRadius = 18
        
        addCloth.layer.cornerRadius = 20
        addCloth.backgroundColor = .white
        addCloth.layer.shadowColor = UIColor.gray.cgColor
        addCloth.layer.shadowOpacity = 0.4
        addCloth.layer.shadowOffset = .zero
        addCloth.layer.shadowRadius = 18
        
        nextButton.layer.cornerRadius = 20
        nextButton.layer.shadowColor = UIColor.gray.cgColor
        nextButton.layer.shadowOpacity = 0.4
        nextButton.layer.shadowOffset = .zero
        nextButton.layer.shadowRadius = 18
        
    }
    
}
class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 25))
    }
    
    
}
