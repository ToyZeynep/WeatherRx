//
//  FavoriteListViewController.swift
//  WeatherRx
//
//  Created by MacOS on 5.03.2022.
//

import Foundation
import RxCocoa
import RxSwift
import RxGesture
import XCoordinator
import Kingfisher
import Action
import UIKit
import RealmSwift

class FavoriteListViewController : UIViewController, BindableType, UICollectionViewDelegate {
    
    private let cellIdentifier = String(describing: FavoriteListCell.self)
    let disposeBag = DisposeBag()
    var favoritesListView = FavoritesListView()
    var viewModel: FavoritesListViewModel!
    var listFlowLayout = ListFlowLayout()
    var favoritesList = [CityListResponse]()
    let imagesArr = [URLString.image0.rawValue , URLString.image16.rawValue ,URLString.image1.rawValue ,URLString.image2.rawValue,URLString.image3.rawValue, URLString.image12.rawValue, URLString.image4.rawValue,URLString.image5.rawValue,URLString.image6.rawValue,  URLString.image13.rawValue ,URLString.image7.rawValue,URLString.image8.rawValue , URLString.image9.rawValue, URLString.image10.rawValue , URLString.image11.rawValue, URLString.image14.rawValue , URLString.image15.rawValue]
    
    var counter = 0{
        didSet{
            if counter == 17{
                counter = 0
            }else{
                
            }
        }
    }
    
    override func loadView() {
        view = favoritesListView
    }
    override func viewDidLoad() {
        registerCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      //  navigationController?.setNavigationBarHidden(true, animated: animated)
        favoritesListView.favoritesListCollectionView.reloadData()
        let image = UIImage(named: "delete")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image , style: .plain, target: self, action: #selector(addTapped))
        navigationController?.navigationBar.tintColor = .black
        navigationItem.rightBarButtonItem?.imageInsets = UIEdgeInsets(top: 3, left: 3, bottom: -4, right: -3)
        navigationController?.navigationBar.backgroundColor = UIColor(rgb: 0xF5F5F5)
    }
    @objc func addTapped(){
        self.deleteButtonProcesses()
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
       // navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func bindViewModel() {
        
        viewModel.output.favoriteList.bind(to: favoritesListView.favoritesListCollectionView.rx.items(cellIdentifier: cellIdentifier, cellType: FavoriteListCell.self)) { [self] _, model , cell in
            
           
            cell.favoriteListCellImageView.kf.setImage(with: URL(string: imagesArr[self.counter]))
            self.counter = counter + 1
            cell.favoriteListCellNameLabel.text = model.title
     
            cell.favoriteListCellDeleteFavoriteButton.backgroundColor = .red
            
            cell.favoriteListCellDeleteFavoriteButton.addTapGesture {
                AppSnackBar.make(in: self.view, message: "\(model.title!) removed  to favorites ", duration: .custom(1.0)).show()
                RealmHelper.sharedInstance.deleteFromDb(city: model)
                self.viewModel.fetchFavoriteList()
            }
            
        }.disposed(by: disposeBag)
        
        favoritesListView.favoritesListCollectionView.rx.modelSelected(CityListResponse.self).bind(to: viewModel.input.selectedCity).disposed(by: disposeBag)
        
        favoritesListView.favoritesListDeleteButton.rx.tapGesture().when(.recognized).subscribe(onNext : { gesture in
            self.deleteButtonProcesses()
        }).disposed(by: disposeBag)
    }

    func registerCollectionView() {
        favoritesListView.favoritesListCollectionView.delegate = self
        favoritesListView.favoritesListCollectionView.register(FavoriteListCell.self, forCellWithReuseIdentifier: "FavoriteListCell")
        favoritesListView.favoritesListCollectionView.collectionViewLayout = listFlowLayout
    }
    
    func deleteButtonProcesses(){
        RealmHelper.sharedInstance.deleteAllFromDatabase()
        self.viewModel.fetchFavoriteList()
        let alertAction = UIAlertAction(title: "OK", style: .default) { UIAlertAction in
            self.viewModel.dismiss()
        }
        self.alertAction(title: "Success", message: "Cleaned Favorite List", action: alertAction)
    }
}
