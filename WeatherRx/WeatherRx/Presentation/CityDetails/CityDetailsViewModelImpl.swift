//
//  CityDetailsViewModelImpl.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action


class CityDetailsViewModelImpl: CityDetailsViewModel, CityDetailsViewModelInput, CityDetailsViewModelOutput, CityDetailsViewModelStoredProperties {
    
    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-
    
    
    // MARK: -Actions-
    
    
    // MARK: -Outputs-
    var cityDetailsResponse = PublishSubject<CityDetailsResponse>()
    var cityDetails = PublishSubject<[WeatherDetails]>()
    var cityTitle = BehaviorSubject<String>(value: "")
    var cityWoeid =  PublishSubject<Int>()
    var weatherStateName =  BehaviorSubject<String> (value: "")
    var date =  BehaviorSubject<String> (value: "")
    var tempeture = BehaviorSubject<String> (value: "")
    var wind = BehaviorSubject<String> (value: "")
    var humidity = BehaviorSubject<String> (value: "")
    var weekDay = BehaviorSubject<String> (value: "")
    // MARK: -Stored properties-
    
    private let city: CityListResponse
    var cityDetailsUseCase = CityDetailsUseCase()
    private let router: UnownedRouter<AppRoute>
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<AppRoute> , city: CityListResponse) {
        self.router = router
        self.city = city
        cityTitle.onNext(city.title!)
        cityWoeid.onNext(city.woeid)
        fetchCityDetails()
    }
    
    func fetchCityDetails() {
        var params: String
        params = city.woeid.toString()
        cityDetailsUseCase.getCityDetails(params: params).subscribe(onNext: { [self] response in
            if response.weatherDetails != nil {
              //  print(response)
                self.cityDetailsResponse.onNext(response)
                setCityDetail(cityDetailsResponse: response.weatherDetails!)
            } else {
                print("There is no such movie")
            }
        }).disposed(by: disposeBag)
    }
    
    func setCityDetail(cityDetailsResponse: [WeatherDetails]) {
        let dateFormatter = DateFormatter(format: "yyyy-MM-dd")
        let model = cityDetailsResponse[0]
        date.onNext((model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM")!)!)
        tempeture.onNext((model.the_temp?.toString())! + "°C")
        wind.onNext((model.wind_speed?.toString())! + " m/s")
        humidity.onNext("% " + (model.humidity?.toString())!)
        weekDay.onNext((model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "EEEE"))!)
        weatherStateName.onNext(model.weather_state_name!)
    }
}

