//
//  Home.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct Home: View {
    @Binding var amount: String
    @ObservedObject var viewModel: CurrencyViewModel
    var body: some View {
        AmountInput(amount: $amount)

        CurrencySelection(viewModel: viewModel)

        ConvertButton(viewModel: viewModel, text: "Convert", amount: $amount)

        Spacer().frame(height: 42)

        CurrencyList(viewModel: viewModel)
    }
}
