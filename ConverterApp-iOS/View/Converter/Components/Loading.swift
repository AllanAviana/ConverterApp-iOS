//
//  Loading.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 21/04/25.
//

import SwiftUI
import SwiftfulLoadingIndicators

struct Loading: View {
    @ObservedObject var viewModel: CurrencyViewModel
    var body: some View {
        Spacer().frame(height: 120)

        LoadingIndicator(animation: .circleTrim,color: .white, size: .medium, speed: .fast)

        Spacer().frame(height: 120)

        ZStack {
            CurrencyList(viewModel: viewModel)
            
            VStack {
                
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white.opacity(0.65))
            .clipShape(RoundedCorner(radius: 32, corners: [.topLeft, .topRight]))
            .padding(.top, 32)
            .ignoresSafeArea()
        }
    }
}
