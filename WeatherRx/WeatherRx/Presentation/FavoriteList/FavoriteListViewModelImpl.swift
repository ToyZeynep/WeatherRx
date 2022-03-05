//
//  FavoriteListViewModelImol.swift
//  WeatherRx
//
//  Created by MacOS on 5.03.2022.
//

import Foundation
import Foundation
import RxSwift
import RxCocoa
import XCoordinator
import Action
import RealmSwift

class FavoriteListViewModelImpl: FavoritesListViewModel, FavoritesListViewModelInput, FavoritesListViewModelOutput, FavoritesListViewModelStoredProperties {
    
    let disposeBag = DisposeBag()
    
    // MARK: -Inputs-
    
    private(set) lazy var selectedCity = selectedCityActions.inputs
    
    // MARK: -Actions-
    
    lazy var selectedCityActions = Action<CityListResponse, Void> { [unowned self] city in
        self.router.rx.trigger(.cityDetails(city: city))
    }
    
    // MARK: -Outputs-
    var favoriteList = PublishSubject<[CityListResponse]>()
    
    // MARK: -Stored properties-
    
    private let router : UnownedRouter<AppRoute>
    
    
    // MARK: -Initialization-
    
    init(router: UnownedRouter<AppRoute> ) {
        self.router = router
        self.fetchFavoriteList()
    }

    func fetchFavoriteList() {
        DispatchQueue.main.async {
            let favoriList = RealmHelper.sharedInstance.fetchFavoriteList().map { $0 }
            var list:[CityListResponse] = [CityListResponse]()
            list.append(contentsOf: favoriList)
            self.favoriteList.onNext(list)
        }
    }
    
    func dismiss() {
        router.trigger(.pop)
    }
}
