//
//  ConverterView.swift
//  ConverterApp-iOS
//
//  Created by Allan Viana on 12/04/25.
//

import SwiftUI

struct ConverterView: View {
    @State private var amount: String = ""
    @EnvironmentObject var viewModel: CurrencyViewModel
    var body: some View {
        VStack{
            HStack{
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
                  .frame(width: 283,height: 50)
                  .background(Color.white)
                  .cornerRadius(15)
            
            HStack(){
                    HStack{
                        Image("USD")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .padding(.leading, 6)
                        
                        Text("USD")
                        Spacer()
                    }
                    .frame(width: 115, height: 52)
                    .background(Color.white)
                    .cornerRadius(15)
                Spacer()
                HStack{
                    Image("EUR")
                        .resizable()
                        .frame(width: 32, height: 32)
                        .padding(.leading, 6)
                    
                    Text("EUR")
                    Spacer()
                }
                .frame(width: 115, height: 52)
                .background(Color.white)
                .cornerRadius(15)
            }
            .frame(maxWidth: 263, alignment: .leading)
            .padding(.top, 16)
            
            Button(action: {}) {
                Text("Converter")
                    .frame(width: 263, height: 50)
                    .foregroundStyle(.white)
                    .background(Color("Color 2"))
                    .cornerRadius(15)
            }
            .padding(.top, 36)

            Spacer()
            Spacer()
            Spacer()
            
            VStack{
                HStack{
                    HStack(spacing: 20){
                        Image("USD")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("USD")
                        
                    }
                    .frame(width: 120)
                    Spacer()
                }
                .frame(width: .infinity)
                .padding(.horizontal, 14)
                .padding(.top, 32)
                
                HStack{
                    HStack(spacing: 20){
                        Image("EUR")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("EUR")
                        
                    }
                    .frame(width: 120)
                    Spacer()
                }
                .frame(width: .infinity)
                .padding(.horizontal, 14)
                .padding(.top, 32)

                HStack{
                    HStack(spacing: 20){
                        Image("BRL")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("BRL")
                        
                    }
                    .frame(width: 120)
                    Spacer()
                }
                .frame(width: .infinity)
                .padding(.horizontal, 14)
                .padding(.top, 32)

                HStack{
                    HStack(spacing: 20){
                        Image("GBP")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("GBP")
                        
                    }
                    .frame(width: 120)
                    Spacer()
                }
                .frame(width: .infinity)
                .padding(.horizontal, 14)
                .padding(.top, 32)

                HStack{
                    HStack(spacing: 20){
                        Image("RUB")
                            .resizable()
                            .frame(width: 50, height: 50)
                        
                        Text("RUB")
                        
                    }
                    .frame(width: 120)
                    Spacer()
                }
                .frame(width: .infinity)
                .padding(.horizontal, 14)
                .padding(.top, 32)

                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.white)
            .clipShape(RoundedCorner(radius:32, corners: [.topLeft, .topRight]))
            .padding(.top, 32)
            .ignoresSafeArea()
            
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color("StormBlue"))
        .navigationBarBackButtonHidden(true)

    }
}


import SwiftUI

struct RoundedCorner: Shape {
    var radius: CGFloat
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}


#Preview {
    ConverterView()
}
