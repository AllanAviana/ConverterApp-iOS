//
//  CurrencyViewModel.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import Foundation

@MainActor
final class CurrencyViewModel: ObservableObject {
    private let repository: CurrencyRepository

    @Published var uiState = UiState()
    @Published var errorMessage: String?
    @Published var currencyInfo: CurrencyInfo?

    private var count = 0

    init(repository: CurrencyRepository = RemoteCurrencyRepository()) {
        self.repository = repository
    }

    func fetchCurrencyInfo(for pair: String, amount: String) async {
        uiState.isLoading = true
        defer { uiState.isLoading = false }

        do {
            let info = try await repository.fetchCurrencyInfo(for: pair)
            currencyInfo = info

            let total = (Double(info.bid) ?? 0) * (Double(amount) ?? 0)
            uiState.value = String(format: "%.2f", total)
            uiState.success = true
        } catch {
            errorMessage = error.localizedDescription
        }
    }

    func updateCountries(with country: String) {
        if count.isMultiple(of: 2) {
            uiState.first_Country = country
        } else {
            uiState.second_Country = country
        }
        count += 1
    }

    func reset() {
        uiState = UiState()
    }
}
