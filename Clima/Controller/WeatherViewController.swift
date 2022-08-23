//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreLocation // user location Library

class WeatherViewController: UIViewController {
    // 'UITextFieldDelegate' is for when user pressed return key on test field shoud be fire the some code
 
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    
    var weatherManager = WeatherManager() // create object for get weather api
    let locationManager = CLLocationManager() // create object for location
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self  // check is user currentlocation pass to return
        locationManager.requestWhenInUseAuthorization() // get permission request to access location
        locationManager.requestLocation() // request location data
        
        weatherManager.delegate = self  //  "weatherManager.delegate = self" is doing check the can fire "didUpdateWeather" protocol
        searchTextField.delegate = self // 'self' this key word for reffer this current view controller
        // 'searchTextField.delegate = self'  for check is user enter some value or pressed return
        
    }
    
    @IBAction func locationPressed(_ sender: UIButton) {
       
        locationManager.requestLocation() // request location
    }
    
}



//MARK: - UITextFieldDelegate
// -------------- extension -------------------

extension WeatherViewController: UITextFieldDelegate { // extension for Text field Protocol
    
    @IBAction func searchPressed(_ sender: UIButton) {
        
        searchTextField.endEditing(true) //close the keyboard
        
       
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {// this function for  delegate whether to process the pressing of the 'Return' button for the text field.
        
        searchTextField.endEditing(true) //close the keyboard
        
        
        return true // pass the bolean to this return function
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // this function for check shoud close editing mode
        if textField.text != "" { //user type any thing
            return true // user enter valus so close editing mode
            }else{  // user didn't type anything
            textField.placeholder = "Type something" // set placeholder to remind user to type
            return false // until user not type anything so  close editing mode
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) { //this function for clear the text field when user end edit text field
        
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city) // pasas the city name of user entered
        }
        searchTextField.text = "" // reset text field
    }
    
}
 

//MARK: - WeatherManagerDelegate
// -------------- extension -------------------

extension WeatherViewController: WeatherManagerDelegate{ // extension for get weather data(JSON) Protocol
    
    func didUpdateWeather(_ weatherManager: WeatherManager , weather: WeatherModel){ // this is a 'WeatherManagerDelegate' protocol requirements
        //print(weather.temparatureString)
        DispatchQueue.main.async { // main thread error fixing
            
            self.temperatureLabel.text = weather.temparatureString // set a 'temparature value' to UI
            self.conditionImageView.image = UIImage(systemName: weather.conditionName) // set a 'Condition image' to UI
            self.cityLabel.text = weather.cityName // set a 'city name' to UI
        }
        
    }
    
    func didFailWithError(error: Error) { // // this is a 'WeatherManagerDelegate' protocol requirements
        print(error)
    }
    
}


//MARK: - CLLocationManagerDelegate
// -------------- extension -------------------

extension WeatherViewController: CLLocationManagerDelegate{ // extension for get current location Protocol
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) { // pass the location by using protocol
        
        if let location = locations.last{ // 'locations.last' is a optional value so to remove optional we had to use 'if condition'
           
            locationManager.stopUpdatingLocation() // after we find location stop find location
            
            let lat = location.coordinate.latitude // get current location 'latitude'
            let lon = location.coordinate.longitude // get current location 'longitude'
        
            weatherManager.fetchWeather(latitude: lat, longitude: lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) { // check error and print it by using protocol
        print(error)
    }
}

