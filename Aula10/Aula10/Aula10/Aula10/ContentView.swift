//
//  ContentView.swift
//  Aula10
//
//  Created by Turma02-8 on 19/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack{
            Text("Personagens de One Piece")
                .font(.title)
            List(vm.personagens, id: \.self){p in
                NavigationLink(destination: Tela2(p: p)){
                    Text(p.nomePersonagem!)
                }
            }.onAppear(){
                vm.fetchPersonagens()
            }
        }
    }
}

#Preview {
    ContentView()
}
