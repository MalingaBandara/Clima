//
//  WeatherData.swift
//  Clima
//
//  Created by Malinga Bandara on 2021-10-07.
//  Copyright © 2021 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Codable{ // "Codable" is a type alias for the 'Encodable' and 'Decodable' protocols.
    
    let name: String // this veriable for find the "name:" data on 'WEATHER API JSON' and assing that value to this
    let main: Main // this veriable for find the "main:{}" data on 'WEATHER API JSON' and assing that value to this
    
    let weather: [Weather] // this veriable is include a array and this veriable for find the ' "weather": [{}] '  data on 'WEATHER API JSON' and assing that value to this.
    
}

struct Main: Codable{ // this for get data called "main" on JSON file this structer has lot of dictonays as well among those diconary we choose our veriabels
    
    let temp: Double // temperater veriable
}

struct Weather: Codable{ //this for get data called "weather" on JSON file this structer has lot of dictonays as well among those diconary we choose our veriabels
    
    let description: String // weather description veriable
    let id: Int // weather description id
    
}
      
