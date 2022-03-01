//
//  CityListViewModel.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import RxSwift
import XCoordinator
import Action
protocol CityListViewModelInput {
    
 // var selectedCity: AnyObserver<CityListResponse> { get }
}
protocol CityListViewModelOutput {
    var cityListResponse: PublishSubject<[CityListResponse]> { get }
    var cityList: PublishSubject<[CityListResponse]> { get }
    
}
protocol CityListViewModelStoredProperties {
    var cityListUseCase : CityListUseCase { get }
    
}

protocol CityListViewModel {
    var input: CityListViewModelInput { get }
    var output: CityListViewModelOutput { get }
    var storedProperties : CityListViewModelStoredProperties { get }
    func fetchCityList(params: [String: Any])
}

extension CityListViewModel where Self: CityListViewModelInput & CityListViewModelOutput & CityListViewModelStoredProperties {
    var input: CityListViewModelInput { return self }
    var output: CityListViewModelOutput { return self }
    var storedProperties: CityListViewModelStoredProperties { return self }
}

