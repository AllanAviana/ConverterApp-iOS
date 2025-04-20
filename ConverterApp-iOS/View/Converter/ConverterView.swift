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
            AmountInput(amount: $amount)

            CurrencySelection(viewModel: viewModel)

            ConvertButton(viewModel: viewModel)

            Spacer().frame(height: 30)

            CurrencyList(viewModel: viewModel)
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
