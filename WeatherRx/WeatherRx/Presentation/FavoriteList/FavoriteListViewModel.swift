//
//  FavoriteListViewModel.swift
//  WeatherRx
//
//  Created by MacOS on 5.03.2022.
//

import Foundation
import RxSwift
import XCoordinator
import Action
import RealmSwift

protocol FavoritesListViewModelInput {
    
  var selectedCity: AnyObserver<CityListResponse> { get }
}
protocol  FavoritesListViewModelOutput {

    var favoriteList: PublishSubject<[CityListResponse]> { get }
    
}
protocol  FavoritesListViewModelStoredProperties {
 
}

protocol  FavoritesListViewModel {
    var input: FavoritesListViewModelInput { get }
    var output: FavoritesListViewModelOutput { get }
    var storedProperties : FavoritesListViewModelStoredProperties { get }
    func fetchFavoriteList()
    func dismiss()
 
}

extension  FavoritesListViewModel where Self: FavoritesListViewModelInput & FavoritesListViewModelOutput & FavoritesListViewModelStoredProperties {
    var input: FavoritesListViewModelInput { return self }
    var output: FavoritesListViewModelOutput { return self }
    var storedProperties: FavoritesListViewModelStoredProperties { return self }
}
