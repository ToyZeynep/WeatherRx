//
//  SplashViewExtension.swift
//  WeatherRx
//
//  Created by MacOS on 3.03.2022.
//

import Foundation
import UIKit
import Foundation

extension SplashView {
    func setUpSplashContentView()  {
        addSubview(splashContentView)
        splashContentView.setTop(equalTo: topAnchor)
        splashContentView.setLeft(equalTo: leftAnchor)
        splashContentView.setRight(equalTo: rightAnchor)
        splashContentView.setBottom(equalTo: bottomAnchor)
    
        setUpSplashImageView()
 
    }
    
    func  setUpSplashImageView(){
        splashContentView.addSubview(splashImageView)
        splashImageView.setRight(equalTo: splashContentView.rightAnchor)
        splashImageView.setLeft(equalTo: splashContentView.leftAnchor)
        splashImageView.setBottom(equalTo: splashContentView.bottomAnchor)
        splashImageView.setTop(equalTo: splashContentView.topAnchor)
    }
    
}
