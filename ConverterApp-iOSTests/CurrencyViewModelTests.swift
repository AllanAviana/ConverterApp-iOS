//
//  CurrencyViewModelTests.swift
//  ConverterApp-iOSTests
//
//  Created by Allan Viana on 09/07/25.
//

// ConverterApp-iOSTests/CurrencyViewModelTests.swift
import XCTest
@testable import ConverterApp_iOS

@MainActor
final class CurrencyViewModelTests: XCTestCase {

    private func fakeInfo() -> CurrencyInfo {
        .init(code: "USD", codein: "BRL", name: "Dollar/Real",
              high: "5.50", low: "5.40", varBid: "0.02",
              pctChange: "0.36", bid: "5.45", ask: "5.46",
              timestamp: "123456", createDate: "2025-07-09 10:00:00")
    }

    @MainActor
    func testFetchCurrencyInfo_success() async {
        let repo = MockCurrencyRepository(mode: .success(fakeInfo()))
        let vm   = CurrencyViewModel(repository: repo)

        await vm.fetchCurrencyInfo(for: "USD-BRL", amount: "10") 

        XCTAssertEqual(vm.currencyInfo?.code, "USD")
        XCTAssertEqual(vm.uiState.value, "54.50")
        XCTAssertTrue(vm.uiState.success)
        XCTAssertFalse(vm.uiState.isLoading)
        XCTAssertNil(vm.errorMessage)
    }

    @MainActor
    func testFetchCurrencyInfo_failure() async {
        struct DummyError: Error {}
        let repo = MockCurrencyRepository(mode: .failure(DummyError()))
        let vm   = CurrencyViewModel(repository: repo)

       await vm.fetchCurrencyInfo(for: "USD-BRL", amount: "10")

        XCTAssertNotNil(vm.errorMessage)
        XCTAssertFalse(vm.uiState.success)
        XCTAssertFalse(vm.uiState.isLoading)
    }

    func testUpdateCountries() {
        let repo = MockCurrencyRepository(mode: .success(fakeInfo()))
        let vm   = CurrencyViewModel(repository: repo)

        vm.updateCountries(with: "🇺🇸")
        XCTAssertEqual(vm.uiState.first_Country, "🇺🇸")

        vm.updateCountries(with: "🇧🇷")
        XCTAssertEqual(vm.uiState.second_Country, "🇧🇷")
    }

    func testReset() {
        let repo = MockCurrencyRepository(mode: .success(fakeInfo()))
        let vm   = CurrencyViewModel(repository: repo)

        vm.uiState.success = true
        vm.reset()
        XCTAssertFalse(vm.uiState.success)
        XCTAssertFalse(vm.uiState.isLoading)
        XCTAssertEqual(vm.uiState.value, "")
    }
}
