//
//  CityDetailsView.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation

import Foundation
import UIKit
import Material
class CityDetailsView : UIView {
    
    lazy var cityDetailsContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var toolBarView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cityDetailsImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var cityDetailsTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityDetailsDateLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityDetailsTempetureLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityDetailsWeekDayLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityDetailsWindLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityDetailsHumidityLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cityDetailsCollectionView: UICollectionView = {
        let layout = ListFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.keyboardDismissMode = .onDrag
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCityDetailsContentView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpCityDetailsContentView()
    }
}
