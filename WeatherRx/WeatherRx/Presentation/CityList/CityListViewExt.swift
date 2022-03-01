//
//  CityListViewExt.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import UIKit
extension CityListView {
    func setUpCityListContentView()  {
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        addSubview(cityListContentView)
        if #available(iOS 11.0, *) {
            cityListContentView.setTop(equalTo: safeAreaLayoutGuide.topAnchor)
        }
        cityListContentView.setLeft(equalTo: leftAnchor)
        cityListContentView.setRight(equalTo: rightAnchor)
        cityListContentView.setBottom(equalTo: bottomAnchor)
        
        setUpToolbarView()
        setUpMovieListToolBarLineView()
        setMovieListCollectionView()
        
    }
    
    func setUpToolbarView() {
        cityListContentView.addSubview(toolbarView)
        toolbarView.setTop(equalTo: cityListContentView.topAnchor)
        toolbarView.setLeft(equalTo: cityListContentView.leftAnchor)
        toolbarView.setRight(equalTo: cityListContentView.rightAnchor)
        setUpSearchBar()
    }
    
    func setUpSearchBar(){
        toolbarView.addSubview(cityListSearchBar)
        cityListSearchBar.setTop(equalTo: toolbarView.topAnchor)
        cityListSearchBar.setLeft(equalTo: toolbarView.leftAnchor)
        cityListSearchBar.setRight(equalTo: toolbarView.rightAnchor)
        cityListSearchBar.setBottom(equalTo: toolbarView.bottomAnchor)
    }

    func setUpMovieListToolBarLineView() {
        cityListContentView.addSubview(cityListToolBarLineView)
        cityListToolBarLineView.setTop(equalTo:  toolbarView.bottomAnchor)
        cityListToolBarLineView.setLeft(equalTo: cityListContentView.leftAnchor)
        cityListToolBarLineView.setRight(equalTo: cityListContentView.rightAnchor)
        cityListToolBarLineView.setHeight(height: 1)
    }
    
    func setMovieListCollectionView()  {
        cityListContentView.addSubview(cityListCollectionView)
        cityListCollectionView.setTop(equalTo: cityListToolBarLineView.bottomAnchor, constant: 5)
        cityListCollectionView.setLeft(equalTo: cityListContentView.leftAnchor)
        cityListCollectionView.setRight(equalTo: cityListContentView.rightAnchor)
        cityListCollectionView.setBottom(equalTo: cityListContentView.bottomAnchor)
        
    }
}
