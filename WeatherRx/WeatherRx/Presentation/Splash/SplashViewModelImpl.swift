//
//  SplashViewModelImpl.swift
//  WeatherRx
//
//  Created by MacOS on 3.03.2022.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class SplashViewModelImpl: SplashViewModel, SplashViewModelInput, SplashViewModelOutput {
    
    // MARK: -Inputs-
    
    // MARK: -Outputs-
    
    // MARK: -Stored properties-
    
    private let router: UnownedRouter<AppRoute>
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<AppRoute>) {
        self.router = router
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.85) {
           self.navigateToCharacterList()
        }
    }
    
    func navigateToCharacterList() {
        router.trigger(.cityList)
    }
}
