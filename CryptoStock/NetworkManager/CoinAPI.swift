//
//  NetworkManager.swift
//  CryptoStock
//
//  Created by Hemant Gore on 25/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import Foundation
import Moya

enum CoinAPI {
    case allCoins
}

extension CoinAPI: TargetType {
    var path: String {
        switch self {
        case .allCoins:
            return "/all/coinlist"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .allCoins:
            return .get
        }
    }
    
//    var sampleData: Data {
//        return Data()
//    }
    
    var task: Task {
        switch self {
        case .allCoins:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return [:]
    }
    
    var environmentBaseURL: String {
        switch NetworkManager.environment {
        case .production: return "https://min-api.cryptocompare.com/data"
        case .qa: return "https://min-api.cryptocompare.com/data"
        }
    }
    var baseURL: URL {
        guard let url = URL(string: environmentBaseURL) else {
            fatalError("Unable to config base url")
        }
         return url
    }
    
    
        
}

