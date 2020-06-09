//
//  ViewController.swift
//  OneWeather
//
//  Created by Mohammed Drame on 6/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit


class ViewController: UIViewController, LoadedData {
    
    // MARK: Outlets
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var tempretureLabel: UILabel!
    @IBOutlet weak var descreptionLabel: UILabel!
    @IBOutlet weak var searchButtonOutlet: UIButton!
    
    // MARK: Actions
    @IBAction func searchButtonTap(_ sender: UIButton) {
        if cityNameTextField.text?.count != 0 {
            cityNameTextField.resignFirstResponder()
            weatherManager.fetchWeather(city: cityNameTextField.text!)
        } else {
            print("Pls Enter City Name")
            // UIAlert (" Pls Enter City Name ")
            weatherManager.fetchWeather(city: "Newark")
        }
    }




func data(rawData: LoadWeaterData) {
    DispatchQueue.main.async {
        self.cityNameLabel.text = rawData.cityName + "📍"
        self.tempretureLabel.text = "\(rawData.tempreture) °"
        self.descreptionLabel.text = rawData.description
    }
}

override func viewDidLoad() {
    super.viewDidLoad()
    // Views SetUp
    setUpView()
    
    cityNameTextField.delegate = self
    weatherManager.weatherDelegate = self
}

// MARK: Instances
var weatherManager = WeatherManager()

func setUpView() {
    view.addSubview(cityNameTextField)
    cityNameTextFieldConstrain()
}


// MARK: UIViews

// MARK: City Name TextField
lazy var cityNameTextField: UITextField = {
    let cityNameTextField = UITextField(frame: .zero)
    cityNameTextField.translatesAutoresizingMaskIntoConstraints = false
    cityNameTextField.placeholder = "City Name"
    cityNameTextField.textColor = .black
    cityNameTextField.textAlignment = .left
    cityNameTextField.adjustsFontForContentSizeCategory = true
    cityNameTextField.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    cityNameTextField.layer.cornerRadius = 6
    cityNameTextField.leftViewMode = .always
    cityNameTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
    return cityNameTextField
}()

func cityNameTextFieldConstrain() {
    NSLayoutConstraint.activate([
        cityNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
        cityNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
        cityNameTextField.heightAnchor.constraint(equalToConstant: 50),
        cityNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -100)
    ])
}




}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.text?.count != 0 {
            textField.resignFirstResponder()
            weatherManager.fetchWeather(city: textField.text!)
        } else {
            print("Pls Enter City Name")
            // UIAlert (" Pls Enter City Name ")
            weatherManager.fetchWeather(city: "Newark")
        }
        return true
    }
    
    
}
