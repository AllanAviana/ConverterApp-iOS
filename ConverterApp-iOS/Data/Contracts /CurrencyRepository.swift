//
//  CurrencyRepository.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 09/07/25.
//

protocol CurrencyRepository {
    func fetchCurrencyInfo(for pair: String) async throws -> CurrencyInfo
}
