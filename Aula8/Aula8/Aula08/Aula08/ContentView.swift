//
//  ContentView.swift
//  Aula08
//
//  Created by Turma02-8 on 14/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationView{
            
            VStack{
                List(vm.marcas, id: \.self){ m in
                    NavigationLink(destination: Tela2(m:  m)){
                        Text(m.nome!)
                    }
                }.onAppear(){
                    vm.fetchMarcas()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
