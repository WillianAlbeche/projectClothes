//
//  TodayViewController.swift
//  ProjectClothes
//
//  Created by Willian Magnum Albeche on 13/08/21.
//

import UIKit
import CoreLocation

class TodayViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet var locationLabel: UILabel!
    var manager: CLLocationManager = CLLocationManager()
    let weatherKey = "2546907a7b457df6e27139df975c5b50"
    var temp = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func getTemperature(lat: CLLocationDegrees, long: CLLocationDegrees, completionHandler: @escaping (Double) -> Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?appid=2546907a7b457df6e27139df975c5b50&lat=\(lat)&lon=\(long)&units=metric")!
        
        typealias webWeather = [String: Any]
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed),
                  let dictionary = json as? [String: Any],
                  let tempList = dictionary["main"] as? webWeather
            else { return }
            
            guard let celsius = tempList["temp"] as? Double
            else { return }
            
            completionHandler(celsius)
        }
        .resume()
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
        
        getTemperature(lat: first.coordinate.latitude, long: first.coordinate.longitude) { result in
            self.temp = result
            
            DispatchQueue.main.async {
                self.locationLabel.text = "\(self.temp)"
            }
        }
        
        manager.stopUpdatingLocation()
    }
}
