//
//  CurrencyViewModel.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import Foundation

class CurrencyViewModel: ObservableObject {
    @Published var currencyInfo: CurrencyInfo?
    @Published var errorMessage: String?
    @Published var UiState: UiState = .init()

    var count: Int = 0

    func fetchCurrencyInfo(for pair: String) {
        UiState.isLoading = true
        let formattedKey = pair.replacingOccurrences(of: "-", with: "")
        let urlString = "https://economia.awesomeapi.com.br/last/\(pair)"

        guard let url = URL(string: urlString) else {
            self.errorMessage = "URL inválida"
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = "Erro na requisição: \(error.localizedDescription)"
                    return
                }

                guard let data = data else {
                    self.errorMessage = "Dados ausentes"
                    return
                }

                do {
                    let decoded = try JSONDecoder().decode([String: CurrencyInfo].self, from: data)
                    self.currencyInfo = decoded[formattedKey]
                    self.UiState.value = self.currencyInfo?.bid ?? ""
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.UiState.isLoading = false
                        self.UiState.sucess = true
                    }
                } catch {
                    self.errorMessage = "Erro ao decodificar: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
    
    func updateCountrys(country: String){
        if count % 2 == 0{
            UiState.first_Country = country
        }else {
            UiState.second_Country = country
        }
        count += 1
    }
    
    func reset(){
        UiState.isLoading = false
        UiState.sucess = false
    }
    
}
