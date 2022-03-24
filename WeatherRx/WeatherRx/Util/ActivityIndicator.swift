//
//  ActivityIndicator.swift
//  WeatherRx
//
//  Created by MacOS on 5.03.2022.
//

import UIKit
import SwiftGifOrigin
class CustomLoader: UIView {
    
    static let instance = CustomLoader()
    
    var viewColor: UIColor = .white
    var setAlpha: CGFloat = 0.8
    var gifName: String = ""
    
    lazy var transparentView: UIView = {
        let transparentView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        transparentView.backgroundColor = viewColor.withAlphaComponent(setAlpha)
        transparentView.isUserInteractionEnabled = false
        return transparentView
    }()
    
    lazy var gifImage: UIImageView = {
        var gifImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        gifImage.contentMode = .scaleToFill
        gifImage.center = transparentView.center
        gifImage.isUserInteractionEnabled = false
        gifImage.loadGif(name: "load")
        return gifImage
    }()
    
    func showLoaderView() {
        self.addSubview(self.transparentView)
        self.transparentView.addSubview(self.gifImage)
        self.transparentView.bringSubviewToFront(self.gifImage)

	    let keyWindow = UIApplication.shared.connectedScenes
	    	    .filter { $0.activationState == .foregroundActive }
	    	    .compactMap {$0 as? UIWindowScene }
	    	    .first?.windows
	    	    .filter(\.isKeyWindow)
	    	    .first
	    keyWindow?.addSubview(transparentView)
    }
    
    func hideLoaderView() {
        self.transparentView.removeFromSuperview()
    }
    
}
