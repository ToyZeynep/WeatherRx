//
//  FavoritesListViewExt.swift
//  WeatherRx
//
//  Created by MacOS on 5.03.2022.
//

import Foundation
import Foundation
import UIKit
import Foundation

extension FavoritesListView {
    func setUpFavoritesListContentView()  {
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        addSubview(favoritesListContentView)
        if #available(iOS 11.0, *) {
            favoritesListContentView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        }
        favoritesListContentView.setLeft(equalTo: leftAnchor)
        favoritesListContentView.setRight(equalTo: rightAnchor)
        favoritesListContentView.setBottom(equalTo: bottomAnchor)
        
        setUpFavoritesListToolBarLineView()
        setUpFavoritesListCollectionView()
        setUpFavoritesListToolBarView()
    }
    
    func setUpFavoritesListToolBarView() {
        favoritesListContentView.addSubview(favoritesListToolBarView)
        favoritesListToolBarView.setTop(equalTo: favoritesListContentView.topAnchor)
        favoritesListToolBarView.setLeft(equalTo: favoritesListContentView.leftAnchor, constant: 15)
        favoritesListToolBarView.setRight(equalTo: favoritesListContentView.rightAnchor, constant: -15)
        favoritesListToolBarView.setHeight(height: 50)
       // setUpFavoritesListDeleteButton()
    }
    
    func setUpFavoritesListDeleteButton() {
        favoritesListToolBarView.addSubview(favoritesListDeleteButton)
        favoritesListDeleteButton.setRight(equalTo: favoritesListToolBarView.rightAnchor, constant: -10)
        favoritesListDeleteButton.setCenterY(equalTo: favoritesListToolBarView.centerYAnchor)
        favoritesListDeleteButton.setHeight(height: 50)
        favoritesListDeleteButton.setWidth(width: 50)
    }
    

    func setUpFavoritesListToolBarLineView() {
        favoritesListContentView.addSubview(favoritesListToolBarLineView)
        favoritesListToolBarLineView.setTop(equalTo: favoritesListContentView.topAnchor)
        favoritesListToolBarLineView.setLeft(equalTo: favoritesListContentView.leftAnchor)
        favoritesListToolBarLineView.setRight(equalTo: favoritesListContentView.rightAnchor)
        favoritesListToolBarLineView.setHeight(height: 1)
    }
    
    func setUpFavoritesListCollectionView() {
        favoritesListContentView.addSubview(favoritesListCollectionView)
        favoritesListCollectionView.setTop(equalTo: favoritesListToolBarLineView.bottomAnchor, constant: 10)
        favoritesListCollectionView.setLeft(equalTo: favoritesListContentView.leftAnchor)
        favoritesListCollectionView.setRight(equalTo: favoritesListContentView.rightAnchor)
        favoritesListCollectionView.setBottom(equalTo: favoritesListContentView.bottomAnchor)
    }
}
