//
//  ConverterApp_iOSApp.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import SwiftUI

@main
struct ConverterApp_iOSApp: App {
    @StateObject private var viewModel = CurrencyViewModel()

    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environmentObject(viewModel)
        }
    }
}
