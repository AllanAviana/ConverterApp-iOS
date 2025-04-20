//
//  CurrencyList.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct CurrencyList: View {
    var viewModel: CurrencyViewModel

    var body: some View {
        VStack {
            ForEach(["USD", "EUR", "BRL", "GBP", "RUB"], id: \.self) { code in
                CurrencyRow(code: code, viewModel: viewModel)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
        .padding(.top, 32)
        .ignoresSafeArea()
    }
}
