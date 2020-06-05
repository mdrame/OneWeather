//
//  WeatherManager.swift
//  OneWeather
//
//  Created by Mohammed Drame on 6/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation

struct WeatherManager {
    
    var url = "https://api.openweathermap.org/data/2.5/weather?appid=8b8286cb872c5238a1941724160e04b9&units=Celsius"
    
    func fetchWeather(city: String) {
        let urlString = "\(url)&q=\(city)"
        print("Concatinated URL: \(urlString)")
        performRequest(url: urlString)
    }
    
    func performRequest(url: String) {
        if let url = URL(string: url) {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil {
                    print("Return Call \(error!)")
                }
                
                if let safeData = data {
                    self.decodeJSON(data: safeData)
                }
            }
            task.resume()
        }
    }
    
    func decodeJSON(data safeData: Data) {
               let decodable = JSONDecoder()
               do {
                    let decoder =  try decodable.decode(WeatherData.self, from: safeData)
                print(decoder.main)
               } catch {
                print("Unable to Decode JSON \(error.localizedDescription)")
               }
           }
    
    
    
}
