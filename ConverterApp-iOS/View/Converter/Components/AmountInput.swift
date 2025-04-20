//
//  AmountInput.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct AmountInput: View {
    @Binding var amount: String

    var body: some View {
        VStack {
            HStack {
                Text("Amount")
                    .font(.system(size: 15))
                    .foregroundStyle(Color.white)
            }
            .frame(maxWidth: 283, alignment: .leading)

            HStack(spacing: 8) {
                Text("$")
                    .foregroundColor(Color("StormBlue"))
                    .font(.system(size: 20, weight: .bold))

                TextField("0", text: $amount)
                    .keyboardType(.numberPad)
                    .font(.system(size: 20, weight: .bold))
                    .frame(height: 50)
                    .foregroundColor(.black)
            }
            .padding(.horizontal)
            .frame(width: 283, height: 50)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}
