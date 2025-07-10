//
//  RemoteCurrencyRepository.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 09/07/25.
//

import Foundation

final class RemoteCurrencyRepository: CurrencyRepository {
    private let session: URLSession

    init(session: URLSession = .shared) {
        self.session = session
    }

    func fetchCurrencyInfo(for pair: String) async throws -> CurrencyInfo {
        let key      = pair.replacingOccurrences(of: "-", with: "")
        let url      = URL(string: "https://economia.awesomeapi.com.br/last/\(pair)")!
        let (data, _) = try await session.data(from: url)

        let decoded  = try JSONDecoder().decode([String: CurrencyInfo].self, from: data)

        guard let info = decoded[key] else {
            throw URLError(.badServerResponse)
        }
        return info
    }
}
