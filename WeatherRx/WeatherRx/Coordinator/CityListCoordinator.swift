//
//  CityListCoordinator.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa
import XCoordinator

enum CityListRoute: Route {
    
    case cityList
    case cityDetails(city: CityListResponse)
}

class CityListCoordinator: NavigationCoordinator<CityListRoute> {
    
    init() {
        super.init(initialRoute: .cityList)
    }
    
    override func prepareTransition(for route: CityListRoute) -> NavigationTransition {
        switch route {
 
       case .cityList:
            let viewController = CityListViewController()
            let viewModel = CityListViewModelImpl(router: unownedRouter)
            viewController.bind(to: viewModel)
        return .push(viewController, animation: .default)

              
        case .cityDetails(let city):
            let viewController = CityDetailsViewController()
            let viewModel = CityDetailsViewModelImpl(router: unownedRouter , city: city)
            viewController.bind(to: viewModel)
        return .push(viewController, animation: .default)
        }
    }
}
