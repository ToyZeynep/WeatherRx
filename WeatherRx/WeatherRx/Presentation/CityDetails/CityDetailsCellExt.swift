//
//  CityDetailsCellExt.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import UIKit
extension CityDetailsCell {
    
    func setUpCityDetailsCellContentView() {
        addSubview(cityDetailsCellContentView)
        cityDetailsCellContentView.setTop(equalTo: topAnchor)
        cityDetailsCellContentView.setLeft(equalTo: leftAnchor, constant: 10)
        cityDetailsCellContentView.setRight(equalTo: rightAnchor, constant: -10)
        cityDetailsCellContentView.setBottom(equalTo: bottomAnchor, constant: -10)
        setCityDetailsImageView()
        setCityDetailsDateLabel()
        setCityDetailsWeekDayLabel()
        setCityDetailsTempLabel()
        setCityDetailsWindLabel()
        setCityDetailsHumidityLabel()
        
    }
    
    func setCityDetailsImageView() {
        cityDetailsCellContentView.addSubview(cityDetailsCellImageView)
        cityDetailsCellImageView.setTop(equalTo: cityDetailsCellContentView.topAnchor)
        cityDetailsCellImageView.setRight(equalTo: cityDetailsCellContentView.rightAnchor)
        cityDetailsCellImageView.setLeft(equalTo: cityDetailsCellContentView.leftAnchor)
        cityDetailsCellImageView.setBottom(equalTo: cityDetailsCellContentView.bottomAnchor)
    }
    
    func setCityDetailsDateLabel (){
        cityDetailsCellContentView.addSubview(cityDetailsCellDateLabel)
        cityDetailsCellDateLabel.setTop(equalTo: cityDetailsCellImageView.topAnchor , constant: 20)
        cityDetailsCellDateLabel.setRight(equalTo: cityDetailsCellImageView.rightAnchor)
        cityDetailsCellDateLabel.setLeft(equalTo: cityDetailsCellImageView.leftAnchor )
    }
    
    func setCityDetailsWeekDayLabel (){
        cityDetailsCellContentView.addSubview(cityDetailsCellWeekDayLabel)
        cityDetailsCellWeekDayLabel.setTop(equalTo: cityDetailsCellDateLabel.topAnchor , constant: 45)
        cityDetailsCellWeekDayLabel.setRight(equalTo: cityDetailsCellImageView.rightAnchor)
        cityDetailsCellWeekDayLabel.setLeft(equalTo: cityDetailsCellImageView.leftAnchor )
    }
    
    func setCityDetailsTempLabel (){
        cityDetailsCellContentView.addSubview(cityDetailsCellTempLabel)
        cityDetailsCellTempLabel.setTop(equalTo: cityDetailsCellWeekDayLabel.topAnchor , constant: 45)
        cityDetailsCellTempLabel.setRight(equalTo: cityDetailsCellImageView.rightAnchor)
        cityDetailsCellTempLabel.setLeft(equalTo: cityDetailsCellImageView.leftAnchor )
    }
    func setCityDetailsWindLabel (){
        cityDetailsCellContentView.addSubview(cityDetailsCellWindLabel)
        cityDetailsCellWindLabel.setTop(equalTo: cityDetailsCellTempLabel.topAnchor , constant: 45)
        cityDetailsCellWindLabel.setRight(equalTo: cityDetailsCellImageView.rightAnchor)
        cityDetailsCellWindLabel.setLeft(equalTo: cityDetailsCellImageView.leftAnchor )
    }
    
    func setCityDetailsHumidityLabel (){
        cityDetailsCellContentView.addSubview(cityDetailsCellHumidityLabel)
        cityDetailsCellHumidityLabel.setTop(equalTo: cityDetailsCellWindLabel.topAnchor , constant: 45)
        cityDetailsCellHumidityLabel.setRight(equalTo: cityDetailsCellImageView.rightAnchor)
        cityDetailsCellHumidityLabel.setLeft(equalTo: cityDetailsCellImageView.leftAnchor )
        
    }
}

