//
//  CityDetailsViewController.swift
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
import SwiftGifOrigin

class CityDetailsViewController: UIViewController, BindableType, UICollectionViewDelegate  {
    
    private let cellIdentifier = String(describing: CityDetailsCell.self)
    let disposeBag = DisposeBag()
    var cityDetailsView = CityDetailsView()
    var viewModel: CityDetailsViewModel!
    var cityDetails = [WeatherDetails]()
    var gridFlowLayout = GridFlowLayout()
   
        
    
    
    override func loadView() {
        view = cityDetailsView
    }
    
    override func viewDidLoad() {
        registerCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
        cityDetailsView.cityDetailsCollectionView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    func bindViewModel() {
        
        viewModel.output.cityDetailsResponse.subscribe(onNext: {[self] response in
            self.cityDetails.append(contentsOf: response.weatherDetails!)
            self.viewModel.output.cityDetails.onNext(self.cityDetails)
            
        }).disposed(by:disposeBag)
        
        viewModel.output.weatherStateName.subscribe(onNext: { [weak self] weatherState in
            self!.setGif(status: weatherState, imageView: self!.cityDetailsView.cityDetailsImageView)
        }).disposed(by:disposeBag)
        
        viewModel.output.cityTitle.bind(to: cityDetailsView.cityDetailsTitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.date.bind(to: cityDetailsView.cityDetailsDateLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.weekDay.bind(to: cityDetailsView.cityDetailsWeekDayLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.wind.bind(to: cityDetailsView.cityDetailsWindLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.humidity.bind(to: cityDetailsView.cityDetailsHumidityLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.tempeture.bind(to: cityDetailsView.cityDetailsTempetureLabel.rx.text).disposed(by: disposeBag)
        
        
        viewModel.output.cityDetails.bind(to: cityDetailsView.cityDetailsCollectionView.rx.items(cellIdentifier:cellIdentifier , cellType: CityDetailsCell.self)){[self] _, model, cell in
            setImage(status: model.weather_state_name!, imageView: cell.cityDetailsCellImageView)
            let dateFormatter = DateFormatter(format: "yyyy-MM-dd")
            cell.cityDetailsCellWindLabel.text = (model.wind_speed?.toString())! + " m/s"
            cell.cityDetailsCellTempLabel.text = (model.the_temp?.toString())! + "°C"
            cell.cityDetailsCellHumidityLabel.text = "%"  +  (model.humidity?.toString())!
            cell.cityDetailsCellDateLabel.text = model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM")
            cell.cityDetailsCellWeekDayLabel.text = model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "EEEE")
            
            cell.cityDetailsCellContentView.addTapGesture {
                viewModel.output.date.onNext((model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM"))!)
                viewModel.output.tempeture.onNext((model.the_temp?.toString())! + "°C")
                viewModel.output.humidity.onNext("%" + (model.humidity?.toString())!)
                viewModel.output.weekDay.onNext((model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "EEEE"))!)
                viewModel.output.wind.onNext((model.wind_speed?.toString())! + " m/s")
                viewModel.output.weatherStateName.onNext(model.weather_state_name!)
                self.setGif(status: model.weather_state_name! , imageView: cityDetailsView.cityDetailsImageView)
            }
        }.disposed(by: disposeBag)
    }
    
    func registerCollectionView() {
        cityDetailsView.cityDetailsCollectionView.delegate = self
        cityDetailsView.cityDetailsCollectionView.register(CityDetailsCell.self, forCellWithReuseIdentifier: "CityDetailsCell")
        cityDetailsView.cityDetailsCollectionView.collectionViewLayout = gridFlowLayout
    }
    
    func setImage(status: String , imageView: UIImageView){
        switch status {
        case WeatherStatus.snow.rawValue : imageView.image = UIImage(named: "snow")
        case WeatherStatus.sleet.rawValue : imageView.image = UIImage(named: "sleet")
        case WeatherStatus.hail.rawValue : imageView.image = UIImage(named: "hail")
        case WeatherStatus.thunderstorm.rawValue : imageView.image = UIImage(named: "thunder")
        case WeatherStatus.showers.rawValue : imageView.image = UIImage(named: "showers")
        case WeatherStatus.heavyRain.rawValue : imageView.image = UIImage(named: "heavyRain")
        case WeatherStatus.lightRain.rawValue : imageView.image = UIImage(named: "lightRain")
        case WeatherStatus.heavyCloud.rawValue : imageView.image = UIImage(named: "heavyCloud")
        case WeatherStatus.lightCloud.rawValue : imageView.image = UIImage(named: "lightCloud")
        case WeatherStatus.clear.rawValue : imageView.image = UIImage(named: "clear")
        default: break
        }
    }
    
    func setGif(status: String , imageView: UIImageView){
        switch status {
        case WeatherStatus.snow.rawValue : imageView.loadGif(asset: "snowGif")
        case WeatherStatus.sleet.rawValue : imageView.loadGif(asset: "sleetGif")
        case WeatherStatus.hail.rawValue : imageView.loadGif(asset: "hailGif")
        case WeatherStatus.thunderstorm.rawValue : imageView.loadGif(asset: "thunderGif")
        case WeatherStatus.showers.rawValue : imageView.loadGif(asset: "showersGif")
        case WeatherStatus.heavyRain.rawValue : imageView.loadGif(asset: "heavyRainGif")
        case WeatherStatus.lightRain.rawValue : imageView.loadGif(asset: "lightRainGif")
        case WeatherStatus.heavyCloud.rawValue : imageView.loadGif(asset: "heavyCloudGif")
        case WeatherStatus.lightCloud.rawValue : imageView.loadGif(asset: "lightCloudGif")
        case WeatherStatus.clear.rawValue : imageView.loadGif(asset: "clearGif")
        default: break
        }
    }
}
