//
//  CityListViewController.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//


import Foundation
import UIKit
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action
import CoreLocation


class CityListViewController: UIViewController, BindableType, UICollectionViewDelegate  {
    
    private let cellIdentifier = String(describing: CityListCell.self)
    let disposeBag = DisposeBag()
    var cityListView = CityListView()
    var viewModel: CityListViewModel!
    var cityList = [CityListResponse]()
    var listFlowLayout = ListFlowLayout()
    let locationManager = CLLocationManager()
    let imagesArr = [URLString.image0.rawValue , URLString.image16.rawValue ,URLString.image1.rawValue ,URLString.image2.rawValue,URLString.image3.rawValue, URLString.image12.rawValue, URLString.image4.rawValue,URLString.image5.rawValue,URLString.image6.rawValue,  URLString.image13.rawValue ,URLString.image7.rawValue,URLString.image8.rawValue , URLString.image9.rawValue, URLString.image10.rawValue , URLString.image11.rawValue, URLString.image14.rawValue , URLString.image15.rawValue]
    
    var coordinates = "" {
        didSet {
            var params: [String: Any] = [String: Any]()
            ///parametre oluşturulup isteğimizi atıyoruz
            params["lattlong"] = coordinates
            viewModel.fetchCityList(params: params)
        }
    }
    
    var counter = 0{
        didSet{
            if counter == 17{
                counter = 0
            }else{
                
            }
        }
    }
    
    override func loadView() {
        view = cityListView
    }
    
    override func viewDidLoad() {
        registerCollectionView()
        cityListView.cityListSearchBar.delegate = self
        locationManager.delegate = self
        getLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        cityListView.cityListCollectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    func bindViewModel() {
        
        viewModel.output.cityListResponse.subscribe(onNext: { response in
            self.cityList.append(contentsOf: response)
            self.viewModel.output.cityList.onNext(self.cityList)
        }).disposed(by: disposeBag)
        
        viewModel.output.cityList.bind(to: cityListView.cityListCollectionView.rx.items(cellIdentifier: cellIdentifier,cellType: CityListCell.self)) { [self] _, model, cell in
            
            cell.cityListCellNameLabel.text = model.title
            cell.cityListCellImageView.kf.setImage(with: URL(string: imagesArr[self.counter]))
            counter = counter + 1
        } .disposed(by: disposeBag)
        
        cityListView.cityListCollectionView.rx.modelSelected(CityListResponse.self).bind(to: viewModel.input.selectedCity).disposed(by: disposeBag)
    }
    
    func registerCollectionView() {
        cityListView.cityListCollectionView.delegate = self
        cityListView.cityListCollectionView.register(CityListCell.self, forCellWithReuseIdentifier: "CityListCell")
        cityListView.cityListCollectionView.collectionViewLayout = listFlowLayout
    }
    
    func getLocation() {
        locationManager.delegate = self
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
            locationManager.requestAlwaysAuthorization()
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        }
        checkLocationPermission()
    }
    
    func checkLocationPermission() {
        switch self.locationManager.authorizationStatus {
        case .authorizedAlways, .authorizedWhenInUse, .authorized:
            locationManager.requestLocation()
        case .denied, .restricted:
            let settingsAction = UIAlertAction(title: "Settings", style: .default) { (_) -> Void in
                guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else {
                    return
                }
                if UIApplication.shared.canOpenURL(settingsUrl) {
                    UIApplication.shared.open(settingsUrl, completionHandler: nil)
                }
            }
            alertAction(title: "Error!", message: "Share your location information for a better experience", action: settingsAction)
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        @unknown default:
            fatalError()
        }
    }
    
}


extension CityListViewController: CLLocationManagerDelegate{
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation :CLLocation = locations[0] as CLLocation
        let lat = userLocation.coordinate.latitude
        let long = userLocation.coordinate.longitude
        self.coordinates = "\(lat),\(long)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // print("Location Error: ", error)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationPermission()
    }
}
// MARK: - SearchBar Delegate

extension CityListViewController : UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(CityListViewController.reload), object: nil)
        self.perform(#selector(CityListViewController.reload), with: nil, afterDelay: 0.7)
    }
    
    @objc func reload() {
        guard let searchText = cityListView.cityListSearchBar.text else { return }
        ///SearchBar'da anahtar kelime silindiğinde lokasyona göre şehir listesini getiriyoruz
        if searchText == "" {
            cityList.removeAll()
            var params: [String: Any] = [String: Any]()
            params["lattlong"] = coordinates
            viewModel?.fetchCityList(params: params)
            
        } else {
            search(searchText: searchText)
        }
        
        func search(searchText: String){
            ///SearchBar'da aranan şehir ismine göre parametre gönderip isteğimizi atıyoruz.
            var params = [String: Any]()
            params["query"] = searchText
            viewModel?.fetchCityList(params: params)
        }
    }
}
