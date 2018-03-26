//
//  Navigation.swift
//  CryptoStock
//
//  Created by Hemant Gore on 27/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import UIKit

class Navigation {
    private let navigationController: UINavigationController
    private let application: Application
    
    init(window: UIWindow, navigationController: UINavigationController, application: Application) {
        self.navigationController = navigationController
        self.application = application
        
        window.rootViewController = self.navigationController
        window.makeKeyAndVisible()
    }
    
    func launch() {
        showCoinListVC()
    }
    
    private func showCoinListVC() {
        let viewModel = CoinListViewModel(networkProvider: application.networkProvider)
        
        viewModel.didSelectCoin = { [weak self] coin in
            self?.showCoinDetails(coin)
        }
        
        let coinListVC = CoinListViewController.instantiate(fromAppStoryboard: .CoinListViewController)
        coinListVC.viewModel = viewModel
        
        self.navigationController.pushViewController(coinListVC, animated: false)
    }
    
    private func showCoinDetails(_ coin: Coin) {
        
    }
}

enum AppStoryboard : String {
    case CoinListViewController
    
    var instance : UIStoryboard {
        
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    func viewController<T : UIViewController>(viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
}

extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        
        return "\(self)"
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        
        return appStoryboard.viewController(viewControllerClass: self)
    }
}

