//
//  ResultCard.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 21/04/25.
//

import SwiftUI

struct ResultCard: View {
    var isVisible: Bool
    var value: String
    var countryCode: String
    
    var body: some View {
        VStack {
            if isVisible {
                HStack {
                    Text("Result")
                        .font(.system(size: 15))
                        .foregroundStyle(Color.white)
                }
                .frame(maxWidth: 283, alignment: .leading)
            }

            HStack {
                Image(countryCode)
                    .resizable()
                    .frame(width: 40, height: 40)
                Text(countryCode)

                Spacer()

                Text(value)
                
                Spacer().frame(width: 32)
            }
            .padding(.horizontal, 10)
            .frame(width: 283, height: 50, alignment: .leading)
            .background(Color.white)
            .cornerRadius(15)
        }
    }
}
