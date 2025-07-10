//
//  WelcomeView.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to\n Currency Converter")
                    .font(.system(size: 32, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.top, 64)
                    .multilineTextAlignment(.center)

                Image("WelcomeImage")
                    .resizable()
                    .frame(width: 292, height: 206)
                    .padding(.leading, 16)
                    .padding(.top, 120)

                Spacer()
                Spacer()

                NavigationLink(destination: {
                    ConverterView()
                }) {
                    ZStack {
                        Circle()
                            .fill(Color("Color 1"))
                            .frame(width: 73, height: 73)
                            .overlay(
                                Circle()
                                    .stroke(
                                        Color("Color 1").opacity(0.4),
                                        lineWidth: 12)
                            )

                        Image("back")
                            .resizable()
                            .frame(width: 34, height: 34)
                            .foregroundColor(.white)
                    }
                }

                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color("StormBlue"))
        }

    }
}

#Preview {
    WelcomeView()
}
