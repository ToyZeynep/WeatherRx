//
//  SplashViewController.swift
//  WeatherRx
//
//  Created by MacOS on 3.03.2022.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift
import XCoordinator
import CommonCrypto

class SplashViewController: UIViewController,BindableType {
    func bindViewModel() {
        
    }
    
    
    private let disposeBag = DisposeBag()
    var splashView = SplashView()
    var viewModel: SplashViewModel!
    
    override func loadView() {
        view = splashView
    }
    
    override func viewDidLoad() {
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}



