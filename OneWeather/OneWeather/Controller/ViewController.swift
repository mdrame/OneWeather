//
//  ViewController.swift
//  OneWeather
//
//  Created by Mohammed Drame on 6/4/20.
//  Copyright © 2020 Mo Drame. All rights reserved.
//

import UIKit


class ViewController: UIViewController, LoadedData {
    
    
    func data(rawData: LoadWeaterData) {
        DispatchQueue.main.async {
            self.cityNameLabel.text = rawData.cityName
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
        view.addSubview(cityNameLabel)
        cityNameLabelConstrain()
    }
    
    
    // MARK: UIViews
    
    // MARK: City Name TextField
    lazy var cityNameTextField: UITextField = {
        let cityNameTextField = UITextField(frame: .zero)
        cityNameTextField.translatesAutoresizingMaskIntoConstraints = false
        cityNameTextField.placeholder = "New York"
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
            cityNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
    
    
    // MARK: City Name Label
    lazy var cityNameLabel: UILabel = {
        let cityNameLabel = UILabel(frame: .zero)
        cityNameLabel.translatesAutoresizingMaskIntoConstraints = false
        cityNameLabel.textAlignment = .center
        return cityNameLabel
    }()
    
    func cityNameLabelConstrain() {
        NSLayoutConstraint.activate([
            cityNameLabel.topAnchor.constraint(equalTo: cityNameTextField.bottomAnchor, constant: 50),
            cityNameLabel.leadingAnchor.constraint(equalTo: cityNameTextField.leadingAnchor, constant: 0),
            cityNameLabel.heightAnchor.constraint(equalToConstant: 100),
            cityNameLabel.leadingAnchor.constraint(equalTo: cityNameTextField.trailingAnchor, constant: 0)
        ])
    }
    
    // MARK: Tempreture Label
    
    // MARK: Description Label
    
    
    


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
