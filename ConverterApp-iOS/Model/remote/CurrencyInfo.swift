//
//  CurrencyInfo.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import Foundation

struct CurrencyInfo: Codable {
    let code: String
    let codein: String
    let name: String
    let high: String
    let low: String
    let varBid: String
    let pctChange: String
    let bid: String
    let ask: String
    let timestamp: String
    let createDate: String

    enum CodingKeys: String, CodingKey {
        case code, codein, name, high, low, varBid, pctChange, bid, ask, timestamp
        case createDate = "create_date"
    }
}

