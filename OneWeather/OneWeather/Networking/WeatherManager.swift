//
//  WeatherManager.swift
//  OneWeather
//
//  Created by Mohammed Drame on 6/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import Foundation

protocol LoadedData {
    func data(rawData: LoadWeaterData)
}

struct WeatherManager {
    
    var url = "https://api.openweathermap.org/data/2.5/weather?appid=8b8286cb872c5238a1941724160e04b9&units=metric"
    var weatherDelegate: LoadedData!
    
    public func fetchWeather(city: String) {
        let urlString = "\(url)&q=\(city)"
        print("Concatinated URL: \(urlString)")
        performRequest(url: urlString)
    }
    
    fileprivate  func performRequest(url: String) {
        if let url = URL(string: url) {
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, urlResponse, error) in
                if error != nil {
                    print("Return Call \(error!)")
                }
                
                if let safeData = data {
                    let loadData = self.decodeJSON(data: safeData)
                    self.weatherDelegate.data(rawData: loadData!)
                }
            }
            task.resume()
        }
    }
    
    func decodeJSON(data safeData: Data)->LoadWeaterData? {
        let decodable = JSONDecoder()
        do {
            let decoder =  try decodable.decode(WeatherData.self, from: safeData)
            let temp = decoder.main.temp
            let cityName = decoder.name
            let description = decoder.weather[0].description
            print("Tempreture: \(temp), CityName: \(cityName), Description: \(description)")
            let loadedWeatherData = LoadWeaterData(tempreture: temp, cityName: cityName, description: description)
           return loadedWeatherData
        } catch {
            print("Unable to Decode JSON \(error.localizedDescription)")
            return nil
        }
    }
    

    
    
}
