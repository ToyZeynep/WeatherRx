//
//  FavoritesListCellExt.swift
//  WeatherRx
//
//  Created by MacOS on 5.03.2022.
//

import Foundation
import UIKit
extension FavoriteListCell {
    
    func setUpFavoriteListCellContentView() {
        addSubview(favoriteListCellContentView)
        favoriteListCellContentView.setTop(equalTo: topAnchor)
        favoriteListCellContentView.setLeft(equalTo: leftAnchor, constant: 10)
        favoriteListCellContentView.setRight(equalTo: rightAnchor, constant: -10)
        favoriteListCellContentView.setBottom(equalTo: bottomAnchor, constant: -10)
        setCityImageView()
        setCityNameLabel()
        setUpFavoriteButton()
        
    }
    
    func setCityImageView() {
        favoriteListCellContentView.addSubview(favoriteListCellImageView)
        favoriteListCellImageView.setTop(equalTo: favoriteListCellContentView.topAnchor)
        favoriteListCellImageView.setRight(equalTo: favoriteListCellContentView.rightAnchor)
        favoriteListCellImageView.setLeft(equalTo: favoriteListCellContentView.leftAnchor)
        favoriteListCellImageView.setBottom(equalTo: favoriteListCellContentView.bottomAnchor)
    }
    
    func setCityNameLabel (){
        favoriteListCellContentView.addSubview(favoriteListCellNameLabel)
        favoriteListCellNameLabel.setTop(equalTo: favoriteListCellImageView.topAnchor , constant: 20)
        favoriteListCellNameLabel.setRight(equalTo: favoriteListCellImageView.rightAnchor , constant: -10)
        favoriteListCellNameLabel.setLeft(equalTo: favoriteListCellImageView.leftAnchor , constant: 10)
    }
    func setUpFavoriteButton()  {
        favoriteListCellContentView.addSubview(favoriteListCellDeleteFavoriteButton)
        favoriteListCellDeleteFavoriteButton.setTop(equalTo: favoriteListCellImageView.topAnchor, constant: 10)
        favoriteListCellDeleteFavoriteButton.setRight(equalTo: favoriteListCellImageView.rightAnchor, constant: -10)
        favoriteListCellDeleteFavoriteButton.setWidth(width: 40)
        favoriteListCellDeleteFavoriteButton.setHeight(height: 40)
    }
}
