//
//  ContentView.swift
//  Aula02UFES
//
//  Created by Turma02-8 on 07/06/24.
//

import SwiftUI


struct ContentView: View {
    @State private var name: String = "Fulano"
    @State private var showDetails = false
    @State private var showingAlert = false

    var body: some View {
        VStack{
            Spacer()
            ZStack{
                Image("hacka")
                    .resizable()
                    .scaledToFill()
                    .frame(height: 900)
                    .opacity(0.3)
                    .blur(radius:3.0)
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 400)
                    Image("truck")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300)
                }
                VStack{
                    ZStack{
                        Button("Entrar"){
                            showDetails.toggle()
                            showingAlert.toggle()
                        }
                        .padding(.top, 800.0)
                        .alert(isPresented:$showingAlert) {
                                                Alert(
                                                title: Text("ALERTA!"),
                                                message: Text("Cuidado"),
                                                dismissButton: .default(Text("Ok"))
                                                )
                                                            }
                        if showDetails{
                            Rectangle()
                                .opacity(0.5)
                                .foregroundColor(.white)
                        }
                        
                    }
                    Rectangle()
                        .frame(width: 180, height: 10)
                        .padding(.bottom, 50)
                        .foregroundColor(.gray)
                }
                VStack(){
                    Text("Bem vindo,  \(name)!")
                        .bold()
                        .font((.largeTitle))
                    TextField("", text: $name)
                        .frame(width: 60)
                    Spacer()
                    
                }
                .padding(.top, 70.0)
            }
                }
            Spacer()
            
    }
}

#Preview {
    ContentView()
}
