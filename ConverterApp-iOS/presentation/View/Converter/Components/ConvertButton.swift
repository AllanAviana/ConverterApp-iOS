//
//  ConvertButton.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct ConvertButton: View {
    var viewModel: CurrencyViewModel
    var text: String
    @Binding var amount: String
    var body: some View {
        Button(action: {
            if text == "Convert" {
                Task {  
                    await viewModel.fetchCurrencyInfo(
                        for:
                            "\(viewModel.uiState.first_Country)-\(viewModel.uiState.second_Country)",
                        amount: amount
                    )
                }
            } else {
                viewModel.reset()
            }
        }) {
            Text(text)
                .frame(width: 263, height: 50)
                .foregroundStyle(.white)
                .background(Color("Color 2"))
                .cornerRadius(15)
        }
        .padding(.top, 36)
    }
}
