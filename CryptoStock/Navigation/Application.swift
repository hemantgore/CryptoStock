//
//  Application.swift
//  CryptoStock
//
//  Created by Hemant Gore on 27/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import UIKit

class Application {
    private let window: UIWindow
    
    lazy var navigation: Navigation = Navigation(window: self.window, navigationController: UINavigationController(), application: self)
    
    lazy var networkProvider = NetworkManager()
    
    init(window: UIWindow) {
        self.window = window
    }
}
