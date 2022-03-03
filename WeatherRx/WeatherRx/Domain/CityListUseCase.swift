//
//  CityListUseCase.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//


import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol CityListUseCaseType {
    
    func getCityList(params: [String: Any]) -> Observable<[CityListResponse]>
}

struct CityListUseCase: CityListUseCaseType {
   
    func getCityList(params: [String : Any]) -> Observable<[CityListResponse]> {
        return ApiClient.getCityList(params: params)
    }
}

