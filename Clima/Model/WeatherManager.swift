//
//  WeatherManager.swift
//  Clima
//
//  Created by Malinga Bandara on 2021-10-02.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation
import CoreLocation

protocol WeatherManagerDelegate { // weather update protocol
    func didUpdateWeather(_ weatherManager: WeatherManager , weather: WeatherModel)// this delegate function for pass the data to "ViewController.swift"
    
    func didFailWithError(error: Error) // this delegate function for print error in failures code
}



struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=e3ca4bcdffc4f276d6f6fd1ee9b2c97a&units=metric" // weather api
    
    var delegate: WeatherManagerDelegate?  // this delegate object (weather update protocol)
    
    
    

    func fetchWeather (cityName: String){ // create url by using user entered city name
        
        let urlString = "\(weatherURL)&q=\(cityName)" //add to api url user input(city name)
        performRequest(urlString) // pass the url to get data
        
    }
    
    func fetchWeather (latitude: CLLocationDegrees , longitude: CLLocationDegrees){// create url by using user current location
        
        let urlString = "\(weatherURL)&lat=\(latitude)&lon=\(longitude)" //add to api url user current location latitude and longitude
        performRequest(urlString) // pass the url to get data
    }
    
    
    
    func performRequest(_ urlString: String){ // get weather data in url
        
        // 1. Create a URL
        if let url = URL(string: urlString){
            
            
            // 2. Create a URLSession
            let session = URLSession(configuration: .default)
            
            
            // 3. Give the session a task
            let task = session.dataTask(with: url) { (data, response, error) in // **Start closure**
                
                if error != nil { // check is error in the url
                    self.delegate?.didFailWithError(error: error!) // fire the failures error delegate function to get display errors in code
                    return
                }// if there is no error
                
                
                if let safeData = data { // data in JSON file they are will be capture in this safeData veriable
                    
                    if let weather = self.parseJSON(safeData){ // 'self' it means same structure. Like in the java 'this.setCart' same in hear
                        self.delegate?.didUpdateWeather(self, weather: weather) //call the delegate protocol and update weather
                    }
                }
            }                                                                    // **end closure**
            
            
            // 4. Start the task
            task.resume()
        }
        
    }
    
    
    
    func parseJSON(_ weatherData: Data) -> WeatherModel? { // pass the value and decording request data
        
        let decoder = JSONDecoder() // 'JSONDecoder()' is object for decoding JSON data
        
        do{
            
            let decodedData =  try decoder.decode(WeatherData.self, from: weatherData) // Find out the  data of requesting in WeatheData' Structure on 'Weather api JSON' and that data decording and assign as well
            
            /*
             print(decodedData.name) // print decooding data
             print(decodedData.main.temp) // print decooding data
             print(decodedData.weather[0].description) // print decooding data
             */

            let id = decodedData.weather[0].id // weather conditon id within decoded
            let temp = decodedData.main.temp // teamparatuer within decoded
            let name = decodedData.name  // city name within decoded
            
            let weather = WeatherModel(conditionId: id, cityName: name, temperature: temp) // call the 'WeatherModel' structuer in "WeatherModel" file
            
            return weather
            
        }catch{
            delegate?.didFailWithError(error: error) // fire the failures error delegate function to get display errors in code
            return nil
        }
    }
    
    
    
}
