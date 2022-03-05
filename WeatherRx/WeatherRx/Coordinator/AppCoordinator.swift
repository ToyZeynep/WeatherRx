//
//  AppCoordinator.swift
//  WeatherRx
//
//  Created by MacOS on 3.03.2022.
//


import Foundation
import UIKit
import RxSwift
import XCoordinator

enum AppRoute: Route {
    case cityList
    case splash
    case cityDetails(city: CityListResponse)
    case favoriteList
    case pop
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    init() {
        super.init(initialRoute: .splash)
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
            
        case . splash :
            let viewController = SplashViewController()
            let viewModel = SplashViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            return .push(viewController, animation: .default)
            
        case .cityList:
             let viewController = CityListViewController()
             let viewModel = CityListViewModelImpl(router: unownedRouter)
             viewController.bind(to: viewModel)
         return .push(viewController, animation: .default)

         case .cityDetails(let city):
             let viewController = CityDetailsViewController()
             let viewModel = CityDetailsViewModelImpl(router: unownedRouter , city: city)
             viewController.bind(to: viewModel)
            viewController.title = "Details"
         return .push(viewController, animation: .default)
            
        case .favoriteList:
            let viewController = FavoriteListViewController()
            let viewModel = FavoriteListViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
            viewController.title = "Favorites"
            return .push(viewController, animation: .default)
            
        case .pop :
            return .pop(animation: .default)
        }
    }
}
