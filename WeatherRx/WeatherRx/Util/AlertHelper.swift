//
//  AlertHelper.swift
//  WeatherRx
//
//  Created by MacOS on 1.03.2022.
//

import Foundation

import UIKit
import Material

extension UIViewController {
    
    func showAlert(title: String, message: String) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertViewController, animated: true, completion: nil)
    }
    
    func alertAction(title: String, message: String, action: UIAlertAction) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
