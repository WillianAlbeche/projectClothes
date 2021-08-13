//
//  ClothesConfigViewController.swift
//  ProjectClothes
//
//  Created by João Gabriel Biazus de Quevedo on 12/08/21.
//

import UIKit

class ClothesConfigViewController: UIViewController {
    
    @IBOutlet weak var appSlider: UISlider!
    @IBOutlet weak var showSliderValue: UILabel!
    
    @IBAction func sliderValueChanged(_ sender: Any) {
        self.showSliderValue.text = "\(self.appSlider.value)"
        
        if self.appSlider.value < 0.25{
            appSlider.minimumTrackTintColor = UIColor(named: "color1")
            appSlider.setThumbImage(UIImage(named: "circle1"), for: .normal)
        }else if self.appSlider.value >= 0.25 && self.appSlider.value < 0.5 {
            appSlider.minimumTrackTintColor = UIColor(named: "color2")
            appSlider.setThumbImage(UIImage(named: "circle2"), for: .normal)
        }else if self.appSlider.value >= 0.5 && self.appSlider.value < 0.75{
            appSlider.minimumTrackTintColor = UIColor(named: "color3")
            appSlider.setThumbImage(UIImage(named: "circle3"), for: .normal)
        }else if self.appSlider.value > 0.75{
            appSlider.minimumTrackTintColor = UIColor(named: "color4")
            appSlider.setThumbImage(UIImage(named: "circle4"), for: .normal)
        }
        
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        appSlider.minimumTrackTintColor = UIColor(named: "color1")
        appSlider.maximumTrackTintColor = .white
        appSlider.setThumbImage(UIImage(named: "circle1"), for: .normal)
        
    }
}
class CustomSlider: UISlider {
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        let point = CGPoint(x: bounds.minX, y: bounds.midY)
        return CGRect(origin: point, size: CGSize(width: bounds.width, height: 50))
    }
}
