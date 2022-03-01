//
//  CityListView.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import UIKit
import Material
class CityListView : UIView {
    
    lazy var cityListContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toolbarView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xF5F5F5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cityListToolBarLineView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray
        return view
    }()
    
    lazy var cityListSearchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.searchBarStyle = .default
        searchBar.placeholder = " Search City"
        searchBar.sizeToFit()
        return searchBar
    }()
    
    lazy var cityListCollectionView: UICollectionView = {
        let layout = ListFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.keyboardDismissMode = .onDrag
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCityListContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCityListContentView()
    }
}
