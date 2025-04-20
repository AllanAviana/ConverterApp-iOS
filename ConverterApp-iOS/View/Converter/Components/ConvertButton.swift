//
//  ConvertButton.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct ConvertButton: View {
    var viewModel: CurrencyViewModel

    var body: some View {
        Button(action: {
            viewModel.fetchCurrencyInfo(for: "\(viewModel.UiState.first_Country)-\(viewModel.UiState.second_Country)")
        }) {
            Text("Converter")
                .frame(width: 263, height: 50)
                .foregroundStyle(.white)
                .background(Color("Color 2"))
                .cornerRadius(15)
        }
        .padding(.top, 36)
    }
}
