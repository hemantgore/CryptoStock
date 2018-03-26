//
//  NetworkManager.swift
//  CryptoStock
//
//  Created by Hemant Gore on 25/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import Foundation
import Moya
import Result

protocol Networkable {
    var provider: MoyaProvider<CoinAPI> { get }
    func getAllCoins(completion: @escaping (CoinResults)->())
}

enum APIEnvironment {
    case production
    case qa
}

struct NetworkManager: Networkable {
    static let environment: APIEnvironment = .qa
    var provider = MoyaProvider<CoinAPI>(plugins: [NetworkLoggerPlugin(verbose: true)])
    
    func getAllCoins(completion: @escaping (CoinResults) -> ()) {
        provider.request(.allCoins) { result in
            switch result {
            case let .success(response):
                do {
                    let result = try JSONDecoder().decode(CoinResults.self, from: response.data)
                    completion(result)
                }
                catch let err {
                    print(err.localizedDescription)
                }
            case let .failure(error):
                print("Error:\(error.localizedDescription)")
            }
        }
    }
}
