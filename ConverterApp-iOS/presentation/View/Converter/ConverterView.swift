//
//  ConverterView.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import SwiftUI

struct ConverterView: View {
    @State private var amount: String = ""
    @EnvironmentObject var viewModel: CurrencyViewModel

    var body: some View {
        VStack {
            if !viewModel.uiState.isLoading && !viewModel.uiState.success {
                Home(amount: $amount, viewModel: viewModel)
            }else if viewModel.uiState.isLoading {
                Loading(viewModel: viewModel)
            }
            else if viewModel.uiState.success {
                success(amount: $amount, viewModel: viewModel)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("StormBlue"))
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ConverterView()
        .environmentObject(CurrencyViewModel())
}
