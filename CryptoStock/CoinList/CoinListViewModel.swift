//
//  CoinListViewModel.swift
//  CryptoStock
//
//  Created by Hemant Gore on 25/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import Foundation

class CoinListViewModel {
    var networkProvider: Networkable!
    
    var didUpdate: ((CoinListViewModel) -> Void)?
    var didSelectCoin: ((Coin) -> Void)?
    
    init(networkProvider: Networkable) {
        self.networkProvider = networkProvider
    }
    
    func reloadCoinList() {
        networkProvider.getAllCoins { (result) in
            print(result.baseImageUrl)
        }
    }
}
