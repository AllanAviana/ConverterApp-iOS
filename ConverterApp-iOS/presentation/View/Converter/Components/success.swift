//
//  success.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 21/04/25.
//

import SwiftUI

struct success: View {
    @Binding var amount: String
    @ObservedObject var viewModel: CurrencyViewModel
    var body: some View {
        ResultCard(isVisible: true,value: amount, countryCode: viewModel.uiState.first_Country)
        
        Image("Arrow")
            .resizable()
            .frame(width: 26, height: 26)
        
        ResultCard(isVisible: false,value: "\(viewModel.uiState.value)", countryCode: viewModel.uiState.second_Country)

        ConvertButton(viewModel: viewModel, text: "Do another conversion", amount: $amount)

        Spacer().frame(height: 26)
        
        ZStack {
            CurrencyList(viewModel: viewModel)
            
            VStack {}
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.opacity(0.65))
            .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
            .padding(.top, 32)
            .ignoresSafeArea()
        }
    }
}
