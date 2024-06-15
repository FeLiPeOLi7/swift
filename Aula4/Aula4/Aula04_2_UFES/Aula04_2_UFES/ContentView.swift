//
//  ContentView.swift
//  Aula04_2_UFES
//
//  Created by Turma02-8 on 11/06/24.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        ZStack{
            Color.purple
            VStack{
                Text("Nome: Tiago\nSobrenome:Pereira")
                    .foregroundColor(.white)
                Button("Press to dismiss") {
                    dismiss()
                }
                .padding()
                .background(.black)
            }
        }
    }
}

struct ContentView: View {
    @State private var showSheet = false
    var body: some View {
        ZStack{
            Color.purple
            .ignoresSafeArea()
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 10)
                Spacer()
                NavigationStack{
                    ZStack{
                        Color.purple
                        .ignoresSafeArea()
                        VStack{
                            NavigationLink(destination: Tela2()){
                                ZStack{
                                    Rectangle()
                                        .foregroundColor(.pink)
                                        .frame(width: 200, height:60)
                                    Text("Modo 1")
                                        .foregroundColor(.white)
                                }
                            }
                            
                            NavigationLink(destination: Tela3()){
                                ZStack{
                                    
                                    Rectangle()
                                        .foregroundColor(.pink)
                                        .frame(width: 200, height:60)
                                    Text("Modo 2")
                                        .foregroundColor(.white)
                                }
                            }
                            
                            Button("Modo 3"){
                                showSheet.toggle()
                            }
                            .frame(width: 200, height: 60)
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .sheet(isPresented: $showSheet) {
                                        SheetView()
                                    }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
