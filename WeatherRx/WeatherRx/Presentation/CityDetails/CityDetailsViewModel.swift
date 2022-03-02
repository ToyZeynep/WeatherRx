//
//  CityDetailsViewModel.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import RxSwift
import XCoordinator
import Action
protocol CityDetailsViewModelInput {
    
}
protocol CityDetailsViewModelOutput {
    var cityDetailsResponse: PublishSubject<CityDetailsResponse> { get }
    var cityDetails: PublishSubject<[WeatherDetails]> { get }
    var cityTitle: BehaviorSubject<String> { get }
    var cityWoeid: PublishSubject<Int> { get }
    var date :  BehaviorSubject<String> { get }
    var tempeture : BehaviorSubject<String> { get }
    var wind : BehaviorSubject<String> { get }
    var humidity : BehaviorSubject<String> { get }
    var weekDay : BehaviorSubject<String> { get }
    var weatherStateName:  BehaviorSubject<String> { get }
}
protocol CityDetailsViewModelStoredProperties {
    var cityDetailsUseCase : CityDetailsUseCase { get }
    
}

protocol CityDetailsViewModel {
    var input: CityDetailsViewModelInput { get }
    var output: CityDetailsViewModelOutput { get }
    var storedProperties : CityDetailsViewModelStoredProperties { get }
  
}

extension CityDetailsViewModel where Self: CityDetailsViewModelInput & CityDetailsViewModelOutput & CityDetailsViewModelStoredProperties {
    var input: CityDetailsViewModelInput { return self }
    var output: CityDetailsViewModelOutput { return self }
    var storedProperties: CityDetailsViewModelStoredProperties { return self }
}

