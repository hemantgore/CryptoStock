//
//  CoinAPI+Testing.swift
//  CryptoStock
//
//  Created by Hemant Gore on 25/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import Moya

extension CoinAPI {
    var sampleData: Data {
        switch self {
        case .allCoins: return stubbedResponse("AllCoins")
        }
    }
}

func stubbedResponse(_ fileName: String) -> Data! {
    @objc class TestClass: NSObject { }
    
    let bundle = Bundle(for: TestClass.self)
    let path = bundle.path(forResource: fileName, ofType: "json")
    return (try? Data(contentsOf: URL(fileURLWithPath: path!)))
}
