//
//  WeatherModel.swift
//  Clima
//
//  Created by Malinga Bandara on 2021-10-12.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel{
    
    let conditionId: Int // weather condition id
    let cityName: String // city name
    let temperature: Double // temperature
    
    

    // this is a computing value
    var temparatureString: String{ // format the 'temperature' to two decimal point String value
        return String(format: "%.1f", temperature)
    }
    
    
    //this is a computing value
    var conditionName: String { // this 'conditionName' is geting a single string method by return on this switch statement
        switch conditionId { // find out the weather condition by using 'conditionId'
            
        case 200...232: // id in between 200-232
            return "cloud.bolt.rain.fill"
            
        case 300...321: // id in between 300-321
            return "cloud.drizzle.fill"
            
        case 500...531:  // id in between 500-531
            return "cloud.rain.fill"
             
        case 600...622: // id in between 600-622
            return "cloud.snow.fill"
            
        case 700...781: // id in between  700-781
            return "cloud.fog.fill"
            
        case 800: // id in 800
            return "sun.max.fill"
            
        case 801...804: // id in between 801-804
            return "cloud.fill"
            
        default:
            return "cloud"
        }
    }
    
 
}

