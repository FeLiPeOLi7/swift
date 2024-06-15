//
//  ContentView.swift
//  Aula04UFES
//
//  Created by Turma02-8 on 11/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            VStack{
                Spacer()
                Rectangle()
                    .frame(height:90)
                    .padding(.bottom, -40 )
                    .foregroundColor(.white)
            }
            TabView{
                RosaView()
                    .tabItem{
                        Label("Rosa", systemImage:"paintbrush.fill")
                    }
                AzulView()
                    .tabItem{
                        Label("Azul", systemImage: "paintbrush.pointed.fill")
                    }
                CinzaView()
                    .tabItem{
                        Label("Cinza", systemImage: "paintpalette.fill")
                    }
                ListaView()
                    .tabItem{
                        Label("Lista", systemImage: "list.bullet")
                    }
            }
        }
    }
}

#Preview {
    ContentView()
}
