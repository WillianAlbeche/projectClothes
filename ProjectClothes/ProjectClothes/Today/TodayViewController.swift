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
    @IBOutlet var preferenceLabel: UILabel!
    
    
    private let constants: Constants = Constants()
    private var manager: CLLocationManager = CLLocationManager()
    private let weatherKey: String = "2546907a7b457df6e27139df975c5b50"
    var auxTemp: Double = 0.0
    var auxIcone: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let first = locations.first else {
            return
        }
        print("long: \(first.coordinate.longitude) | lat: \(first.coordinate.latitude)")
        
        getTemperature(lat: first.coordinate.latitude, long: first.coordinate.longitude) { temp, icone in
            self.auxTemp = temp
            self.auxIcone = icone
            print("temp : \(self.auxTemp)")
            print("icone : \(self.auxIcone)")
            DispatchQueue.main.async {
                self.tempLabel.text = "\(Int(self.auxTemp))° "
                self.iconeLabel.text = self.auxIcone
                self.preferenceLabel.text = ("Dê preferência: \(self.constants.recommendationPhrase(temperatures: Int(self.auxTemp)))")
            }
        }
        
        manager.stopUpdatingLocation()
    }
    
    private func getTemperature(lat: CLLocationDegrees, long: CLLocationDegrees, completionHandler: @escaping (Double, String) -> Void) {
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
            guard let weatherIcone = weatherList2["main"] as? String else { return }
            
            completionHandler(celsius, weatherIcone)
        }
        .resume()
    }
}
