//
//  CityDetailsUseCase.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//


import Foundation
import Alamofire
import RxSwift
import RxCocoa

protocol CityDetailsUseCaseType {
    func getCityDetails(params: String) -> Observable<CityDetailsResponse>
}


struct CityDetailsUseCase: CityDetailsUseCaseType {
   
    func getCityDetails(params: String ) -> Observable<CityDetailsResponse> {
        return ApiClient.getCityDetails(params: params)
    }
    

}
