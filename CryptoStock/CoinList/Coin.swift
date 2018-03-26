//
//  Coin.swift
//  CryptoStock
//
//  Created by Hemant Gore on 25/03/18.
//  Copyright © 2018 Dream Big. All rights reserved.
//

import Foundation

// CoinResults Model
struct CoinResults {
    let response: String
    let message: String
    let baseImageUrl: String
    let baseLinkUrl: String
    let defaultWatchList: DefaultWatchlist
//    let coins: [Coin]
    let data: [String: Coin]
}

extension CoinResults: Decodable {
    enum CoinResultsCodingKeys: String, CodingKey {
        case response = "Response"
        case message = "Message"
        case baseImageUrl = "BaseImageUrl"
        case baseLinkUrl = "BaseLinkUrl"
        case defaultWatchList = "DefaultWatchlist"
//        case coins
        case data = "Data"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CoinResultsCodingKeys.self)
        
        response = try container.decode(String.self, forKey: .response)
        message = try container.decode(String.self, forKey: .message)
        baseImageUrl = try container.decode(String.self, forKey: .baseImageUrl)
        baseLinkUrl = try container.decode(String.self, forKey: .baseLinkUrl)
        defaultWatchList = try container.decode(DefaultWatchlist.self, forKey: .defaultWatchList)
//        let coinsValues = try container.nestedContainer(keyedBy: CoinResultsCodingKeys.self, forKey: .data)
        data = try container.decode([String: Coin].self, forKey: .data)
    }
}

// WathcList Model
struct DefaultWatchlist {
    let coinIs: String
    let sponsored: String
}

extension DefaultWatchlist: Decodable {
    enum DefaultWatchlistCodingKeys: String, CodingKey {
        case coinIs = "CoinIs"
        case sponsored = "Sponsored"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DefaultWatchlistCodingKeys.self)
        
        coinIs = try container.decode(String.self, forKey: .coinIs)
        sponsored = try container.decode(String.self, forKey: .sponsored)
    }
}

// Coin Model
struct Coin {
    let ID: String
    let url: String
    let imageUrl: String
    let name: String
    let symbol: String
    let coinName: String
    let fullName: String
    let algorithm: String
    let proofType: String
    let fullyPremined: String
    let totalCoinSupply: String
    let preMinedValue: String
    let totalCoinsFreeFloat: String
    let sortOrder: String
    let sponsored: Bool
    let isTrading: Bool
}

extension Coin: Decodable {
    enum CoinCodingKeys: String, CodingKey {
        case ID = "Id"
        case url = "Url"
        case imageUrl = "ImageUrl"
        case name = "Name"
        case symbol = "Symbol"
        case coinName = "CoinName"
        case fullName = "FullName"
        case algorithm = "Algorithm"
        case proofType = "ProofType"
        case fullyPremined = "FullyPremined"
        case totalCoinSupply = "TotalCoinSupply"
        case preMinedValue = "PreMinedValue"
        case totalCoinsFreeFloat = "TotalCoinsFreeFloat"
        case sortOrder = "SortOrder"
        case sponsored = "Sponsored"
        case isTrading = "IsTrading"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CoinCodingKeys.self)
        
        ID = try container.decode(String.self, forKey: .ID)
        url = try container.decode(String.self, forKey: .url)
        imageUrl = try container.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
        name = try container.decode(String.self, forKey: .name)
        symbol = try container.decode(String.self, forKey: .symbol)
        coinName = try container.decode(String.self, forKey: .coinName)
        fullName = try container.decode(String.self, forKey: .fullName)
        algorithm = try container.decode(String.self, forKey: .algorithm)
        proofType = try container.decode(String.self, forKey: .proofType)
        fullyPremined = try container.decode(String.self, forKey: .fullyPremined)
        totalCoinSupply = try container.decode(String.self, forKey: .totalCoinSupply)
        preMinedValue = try container.decode(String.self, forKey: .preMinedValue)
        totalCoinsFreeFloat = try container.decode(String.self, forKey: .totalCoinsFreeFloat)
        sortOrder = try container.decode(String.self, forKey: .sortOrder)
        sponsored = try container.decode(Bool.self, forKey: .sponsored)
        isTrading = try container.decodeIfPresent(Bool.self, forKey: .isTrading) ?? false
    }
}
