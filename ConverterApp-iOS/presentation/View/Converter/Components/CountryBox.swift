//
//  CountryBox.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 20/04/25.
//

import SwiftUI

struct CountryBox: View {
    var imageName: String
    var code: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 32, height: 32)
                .padding(.leading, 6)
            Text(code)
            Spacer()
        }
        .frame(width: 115, height: 52)
        .background(Color.white)
        .cornerRadius(15)
    }
}
