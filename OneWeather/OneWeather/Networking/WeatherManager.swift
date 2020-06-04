//
//  WeatherManager.swift
//  OneWeather
//
//  Created by Mohammed Drame on 6/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    var url = "api.openweathermap.org/data/2.5/weather?appid=8b8286cb872c5238a1941724160e04b9"
    
    func fetchWeather(city: String) {
        let urlString = "\(url)&q=\(city)"
        print(urlString)
    }
    
}
