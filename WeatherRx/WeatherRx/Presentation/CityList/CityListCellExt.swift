//
//  CityListCellExt.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import UIKit
extension CityListCell {
    
    func setUpCityListCellContentView() {
        addSubview(cityListCellContentView)
        cityListCellContentView.setTop(equalTo: topAnchor)
        cityListCellContentView.setLeft(equalTo: leftAnchor, constant: 10)
        cityListCellContentView.setRight(equalTo: rightAnchor, constant: -10)
        cityListCellContentView.setBottom(equalTo: bottomAnchor, constant: -10)
        setCityImageView()
        setCityNameLabel()
        setUpFavoriteButton()
        
    }
    
    func setCityImageView() {
        cityListCellContentView.addSubview(cityListCellImageView)
        cityListCellImageView.setTop(equalTo: cityListCellContentView.topAnchor)
        cityListCellImageView.setRight(equalTo: cityListCellContentView.rightAnchor)
        cityListCellImageView.setLeft(equalTo: cityListCellContentView.leftAnchor)
        cityListCellImageView.setBottom(equalTo: cityListCellContentView.bottomAnchor)
    }
    
    func setCityNameLabel (){
        cityListCellContentView.addSubview(cityListCellNameLabel)
        cityListCellNameLabel.setTop(equalTo: cityListCellImageView.topAnchor , constant: 20)
        cityListCellNameLabel.setRight(equalTo: cityListCellImageView.rightAnchor , constant: -10)
        cityListCellNameLabel.setLeft(equalTo: cityListCellImageView.leftAnchor , constant: 10)
    }
    func setUpFavoriteButton()  {
        cityListCellContentView.addSubview(cityListCellAddFavoriteButton)
        cityListCellAddFavoriteButton.setTop(equalTo: cityListCellImageView.topAnchor, constant: 10)
        cityListCellAddFavoriteButton.setRight(equalTo: cityListCellImageView.rightAnchor, constant: -10)
        cityListCellAddFavoriteButton.setWidth(width: 40)
        cityListCellAddFavoriteButton.setHeight(height: 40)
    }
}
