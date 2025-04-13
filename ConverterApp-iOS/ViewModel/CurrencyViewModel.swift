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
    
    init(){
        fetchCurrencyInfo(for: "USD-BRL")
    }

    func fetchCurrencyInfo(for pair: String) {
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
                    print(self.currencyInfo)
                } catch {
                    self.errorMessage = "Erro ao decodificar: \(error.localizedDescription)"
                }
            }
        }.resume()
    }
}
