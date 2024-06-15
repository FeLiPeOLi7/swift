//
//  ListaView.swift
//  Aula04UFES
//
//  Created by Turma02-8 on 11/06/24.
//

import SwiftUI

struct ListaView: View {
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    NavigationLink(destination: RosaView()){
                        Spacer()
                        Text("Rosa")
                        Spacer()
                        Image(systemName: "paintbrush")
                        Spacer()
                    }
                }
                HStack{
                    NavigationLink(destination: AzulView()){
                        Spacer()
                        Text("Azul")
                        Spacer()
                        Image(systemName: "paintbrush.pointed")
                        Spacer()
                    }
                }
                HStack{
                    NavigationLink(destination: CinzaView()){
                        Spacer()
                        Text("Cinza")
                        Spacer()
                        Image(systemName: "paintpalette")
                        Spacer()
                    }
                }
                Spacer()
            }
            .navigationTitle("List")
        }
    }
}

#Preview {
    ListaView()
}
