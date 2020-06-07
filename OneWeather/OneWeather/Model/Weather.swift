//
//  Weather.swift
//  OneWeather
//
//  Created by Mohammed Drame on 6/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    var main: Main
    var name: String
    var weather: [Weather]
}

 struct Main: Decodable {
    var temp: Double
}

  struct Weather: Decodable {
    var description: String
}
