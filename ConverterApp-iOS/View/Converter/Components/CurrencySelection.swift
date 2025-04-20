//
//  CurrencySelection.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct CurrencySelection: View {
    @ObservedObject var viewModel: CurrencyViewModel

    var body: some View {
        HStack {
            CountryBox(imageName: viewModel.UiState.first_Country, code: viewModel.UiState.first_Country)
            Spacer()
            CountryBox(imageName: viewModel.UiState.second_Country, code: viewModel.UiState.second_Country)
        }
        .frame(maxWidth: 263, alignment: .leading)
        .padding(.top, 16)
    }
}
