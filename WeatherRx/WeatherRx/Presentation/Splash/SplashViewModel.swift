//
//  SplashViewModel.swift
//  WeatherRx
//
//  Created by MacOS on 3.03.2022.
//


import Foundation
import RxSwift
import XCoordinator
import Action

protocol SplashViewModelInput {
    
}

protocol SplashViewModelOutput {
    
}

protocol SplashViewModel {
    var input: SplashViewModelInput { get }
    var output: SplashViewModelOutput { get }
    
    func navigateToCharacterList()
}

extension SplashViewModel where Self: SplashViewModelInput & SplashViewModelOutput {
    var input: SplashViewModelInput { return self }
    var output: SplashViewModelOutput { return self }
}
