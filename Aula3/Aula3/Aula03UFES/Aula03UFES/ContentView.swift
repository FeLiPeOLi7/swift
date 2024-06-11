//
//  ContentView.swift
//  Aula03UFES
//
//  Created by Turma02-8 on 10/06/24.
//

import SwiftUI

struct ContentView: View {
    @State private var Stringpeso: String = ""
    @State private var Stringaltura: String = ""
    @State private var peso: Float = 0.0
    @State private var altura: Float = 0.0
    @State private var status: String = "Normal"
    @State private var color: Color? = .normal
    
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Text("Calculadora de IMC")
                    .font(.largeTitle)
                    .bold()
                HStack{
                    TextField("Peso:",text: $Stringpeso)
                        .frame(width: 250)
                        .background(.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(10)
                        
                        
                }
                HStack{
                    TextField("Altura:",text: $Stringaltura)
                        .frame(width: 250)
                        .background(.white)
                        .multilineTextAlignment(.center)
                        .cornerRadius(10)
                        .padding()
                }
                Button("Calcular"){
                    peso = (Stringpeso as NSString).floatValue
                    altura = (Stringaltura as NSString).floatValue
                    let imc: Float
                    imc = (peso/(altura*altura))
                    if imc < 18.5{
                        status = "Baixo Peso"
                        color = .baixoPeso
                    }
                    else if imc >= 18.5 && imc <= 24.99{
                        status = "Normal"
                        color = .normal
                    }else if imc >= 25 && imc <= 29.99{
                        status = "Sobrepeso"
                        color = .sobrepeso
                    }
                    else if imc > 30{
                        status = "Obesidade"
                        color = .obesidade
                    }
                    print("\(imc)")
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .frame(width:100, height:40)
                .cornerRadius(10)
                .padding(.top, 30)
                .padding(.leading, -15)
                
                Spacer()
                Text("\(status)")
                    .font(.title)
                    .padding(.trailing, 15)
                Spacer()
                Image("imc")
                    .resizable()
                    .scaledToFit()
                Spacer()
            }
            .frame(width:400, height:900)
            .background(color)
        }
    }
}

#Preview {
    ContentView()
}
