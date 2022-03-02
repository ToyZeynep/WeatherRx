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
        viewModel.output.cityTitle.bind(to: cityDetailsView.cityDetailsTitleLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.date.bind(to: cityDetailsView.cityDetailsDateLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.weekDay.bind(to: cityDetailsView.cityDetailsWeekDayLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.wind.bind(to: cityDetailsView.cityDetailsWindLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.humidity.bind(to: cityDetailsView.cityDetailsHumidityLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.tempeture.bind(to: cityDetailsView.cityDetailsTempetureLabel.rx.text).disposed(by: disposeBag)
        viewModel.output.cityDetailsResponse.subscribe(onNext: {[self] response in
            self.cityDetails.append(contentsOf: response.weatherDetails!)
            self.viewModel.output.cityDetails.onNext(self.cityDetails)
        }).disposed(by:disposeBag)
        
        viewModel.output.cityDetails.bind(to: cityDetailsView.cityDetailsCollectionView.rx.items(cellIdentifier:cellIdentifier , cellType: CityDetailsCell.self)){[self] _, model, cell in
           
            let dateFormatter = DateFormatter(format: "yyyy-MM-dd")
            cell.cityDetailsCellWindLabel.text = model.wind_speed?.toString()
            cell.cityDetailsCellTempLabel.text = model.the_temp?.toString()
            cell.cityDetailsCellHumidityLabel.text = model.humidity?.toString()
            cell.cityDetailsCellDateLabel.text = model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM")
            cell.cityDetailsCellWeekDayLabel.text = model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "EEEE")
            
            cell.cityDetailsCellContentView.addTapGesture {
                viewModel.output.date.onNext((model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "dd MMMM"))!)
                viewModel.output.tempeture.onNext((model.the_temp?.toString())! + "°C")
                viewModel.output.humidity.onNext("%" + (model.humidity?.toString())!)
                viewModel.output.weekDay.onNext((model.applicable_date?.toDateString(dateFormatter: dateFormatter, outputFormat: "EEEE"))!)
                viewModel.output.wind.onNext((model.wind_speed?.toString())! + "m/s")
            }
        }.disposed(by: disposeBag)
    }
    
    func registerCollectionView() {
        cityDetailsView.cityDetailsCollectionView.delegate = self
        cityDetailsView.cityDetailsCollectionView.register(CityDetailsCell.self, forCellWithReuseIdentifier: "CityDetailsCell")
        cityDetailsView.cityDetailsCollectionView.collectionViewLayout = gridFlowLayout
    }
}
