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
    
    
    private let constants: Constants = Constants()
    private var manager: CLLocationManager = CLLocationManager()
    private let weatherKey: String = "2546907a7b457df6e27139df975c5b50"
    var auxTemp: Double = 0.0
    var auxIcone: String = ""
    var auxIconeLabel: String = ""
    var isAuthorized: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadingWeather.startAnimating()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        if(manager.authorizationStatus == CLAuthorizationStatus.authorizedAlways || manager.authorizationStatus == CLAuthorizationStatus.authorizedWhenInUse){
            print("authorized")
            isAuthorized = true
        } else if(manager.authorizationStatus == CLAuthorizationStatus.denied){
            print("locked")
            isAuthorized = false
            if !isAuthorized {
                let ac = UIAlertController(title: "location authorization denied", message: "You need to authorize location services in settings.", preferredStyle: .alert)
                ac.addAction((UIAlertAction(title: "Go to settings", style: .default, handler: { (action) -> Void in
                    //This will call when you press ok in your alertview
                    guard let settingsUrl = NSURL(string: UIApplication.openSettingsURLString) as URL? else {return}
                    UIApplication.shared.open(settingsUrl )
                })))
                ac.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
                self.present(ac, animated: true)
            }
        }

        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
    }
    
    //    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
    //
    //        if(status == .authorizedAlways || status == .authorizedWhenInUse){
    //            print("authorized")
    //        } else if(status == .denied){
    //            print("locked")
    //        }
    //
    //    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        print("long: \(first.coordinate.longitude) | lat: \(first.coordinate.latitude)")
        
        getTemperature(lat: first.coordinate.latitude, long: first.coordinate.longitude) { temp, iconeLabel, icone in
            self.auxTemp = temp
            self.auxIconeLabel = iconeLabel
            
            
            
            print("temp : \(self.auxTemp)")
            print("icone : \(self.auxIconeLabel)")
            DispatchQueue.main.async {
                self.tempLabel.text = "\(Int(self.auxTemp))° "
                self.iconeLabel.text = self.auxIconeLabel
                self.iconeImage.image = icone
                self.preferenceLabel.text = ("Dê preferência: \(self.constants.recommendationPhrase(temperatures: Int(self.auxTemp)))")
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
}
