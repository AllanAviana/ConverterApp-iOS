//
//  CurrencyRow.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct CurrencyRow: View {
    var code: String
    var viewModel: CurrencyViewModel

    var body: some View {
        HStack {
            HStack(spacing: 20) {
                Image(code)
                    .resizable()
                    .frame(width: 50, height: 50)
                Text(code)
            }
            .frame(width: 120)
            .onTapGesture {
                viewModel.updateCountries(with: code)
            }
            Spacer()
        }
        .frame(width: .infinity)
        .padding(.horizontal, 14)
        .padding(.top, 32)
    }
}

