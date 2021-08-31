//
//  TodayViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 13/08/21.
//

import UIKit
import CoreLocation


class TodayViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var iconeLabel: UILabel!
    @IBOutlet weak var iconeImage: UIImageView!
    @IBOutlet var preferenceLabel: UILabel!
    @IBOutlet weak var loadingWeather: UIActivityIndicatorView!
    @IBOutlet weak var onBoardingView: UIView!
    @IBOutlet weak var tempIconView: UIImageView!
    
    
    private let constants: Constants = Constants()
    private var manager: CLLocationManager = CLLocationManager()
    private let weatherKey: String = "2546907a7b457df6e27139df975c5b50"
    var auxTemp: Double = 0.0
    var auxIcone: String = ""
    var auxIconeLabel: String = ""
    var isAuthorized: Bool = false
    var isSelectedGender: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //onBoardingView.isHidden = DatabaseManager.shared.loadOnboardingDone()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        atualizaTelaToday()

        //Timer to refresh
        let timeToRefresh: Timer?
        
        timeToRefresh = Timer.scheduledTimer(timeInterval: 3600, target: self, selector: #selector(atualizaTelaToday), userInfo: nil, repeats: true)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let genderprint = DatabaseManager.shared.loadGender()
        print("gedner : \(genderprint)")
    }
    
    @objc func atualizaTelaToday(){
        loadingWeather.startAnimating()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        
        DatabaseManager.shared.checkLocationAuth(locationManager: manager, vc: self)
        
        manager.requestWhenInUseAuthorization()
        
        manager.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        print("long: \(first.coordinate.longitude) | lat: \(first.coordinate.latitude)")
        
        getTemperature(lat: first.coordinate.latitude, long: first.coordinate.longitude) { temp, iconeLabel, icone in
            self.auxTemp = temp
            self.auxIconeLabel = iconeLabel
            guard let auxIcone = UIImage(named: self.constants.recommendationIcone(temperatures: Int(temp))) else { return }
            
            
            print("temp : \(self.auxTemp)")
            print("icone : \(self.auxIconeLabel)")
            DispatchQueue.main.async { [self] in
                self.tempLabel.text = "\(Int(self.auxTemp))° "
                self.iconeLabel.text = self.auxIconeLabel
                self.iconeImage.image = icone
                self.preferenceLabel.text = ("Dê preferência: \(self.constants.recommendationPhrase(temperatures: Int(self.auxTemp)))")
                self.tempIconView.image = auxIcone
                self.loadingWeather.stopAnimating()
            }
        }
        
        manager.stopUpdatingLocation()
    }
    
    private func getTemperature(lat: CLLocationDegrees, long: CLLocationDegrees, completionHandler: @escaping (Double, String, UIImage) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=2546907a7b457df6e27139df975c5b50&lat=\(lat)&lon=\(long)&units=metric")!
        
        typealias webWeather = [String: Any]
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let mainList = dictionary["main"] as? webWeather,
                  let celsius = mainList["temp"] as? Double,
                  let weatherList = dictionary["weather"] as? [webWeather]
            else { return }
            
            let weatherList2 = weatherList[0]
            guard let weatherIconeLabel = weatherList2["main"] as? String,
                  let weatherIcone = weatherList2["icon"] as? String
            else { return }
            
            self.getIconeImage(name: weatherIcone) { image in
                completionHandler(celsius, weatherIconeLabel, image)
            }
            
        }
        .resume()
    }
    
    private func getIconeImage(name: String, completionHandler: @escaping (UIImage) -> Void) {
        let url = URL(string: "https://openweathermap.org/img/wn/\(name)@2x.png")!
        
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data
            
            else { return }
            
            guard let passing = UIImage(data: data) else { return }
            
            completionHandler(passing)
        }
        .resume()
    }
    
    @IBAction func generoButton(_ sender: UIButton) {
//        switch sender.tag {
//        case 0: isSelectedGender = DatabaseManager.shared.storeGender(userGender: "Feminino")
//            print(sender.tag)
//        case 1: isSelectedGender = DatabaseManager.shared.storeGender(userGender: "Masculino")
//            print(sender.tag)
//        case 2: isSelectedGender = DatabaseManager.shared.storeGender(userGender: "Não binário")
//            print(sender.tag)
//        default: isSelectedGender = false
//        }
//
//        DatabaseManager.shared.onboardingDone(genderSave: isSelectedGender)
//
//        onBoardingView.isHidden = isSelectedGender
//
//
//
        
    }
}

