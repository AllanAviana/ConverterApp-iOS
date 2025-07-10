//
//  MockCurrencyRepository.swift
//  ConverterApp-iOSTests
//
//  Created by Allan Viana on 09/07/25.
//

import Foundation
@testable import ConverterApp_iOS
final class MockCurrencyRepository: CurrencyRepository {
    enum Mode {
        case success(CurrencyInfo)
        case failure(Error)
    }

    private let mode: Mode
    init(mode: Mode) { self.mode = mode }

    func fetchCurrencyInfo(for pair: String) async throws -> CurrencyInfo {
        switch mode {
        case .success(let info):
            return info
        case .failure(let error):
            throw error
        }
    }
}

