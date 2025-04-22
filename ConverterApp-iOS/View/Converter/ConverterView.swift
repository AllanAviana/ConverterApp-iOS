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
            if !viewModel.UiState.isLoading && !viewModel.UiState.sucess {
                Home(amount: $amount, viewModel: viewModel)
            }else if viewModel.UiState.isLoading {
                Loading(viewModel: viewModel)
            }
            else if viewModel.UiState.sucess {
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
