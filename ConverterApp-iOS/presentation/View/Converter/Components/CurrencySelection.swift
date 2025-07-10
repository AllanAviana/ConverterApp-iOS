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
            CountryBox(imageName: viewModel.uiState.first_Country, code: viewModel.uiState.first_Country)
            Spacer()
            CountryBox(imageName: viewModel.uiState.second_Country, code: viewModel.uiState.second_Country)
        }
        .frame(maxWidth: 263, alignment: .leading)
        .padding(.top, 16)
    }
}
