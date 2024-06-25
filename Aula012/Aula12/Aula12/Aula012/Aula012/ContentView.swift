//
//  ContentView.swift
//  Aula012
//
//  Created by Turma02-8 on 24/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
            Text("Mostra umidade do sensor ESP")
            List(vm.umidades, id: \.self){v in
                ScrollView{
                    Text(v.umidade!)
                }
            }.onAppear(){
                vm.fetchUmidade()
            }
    }
}

#Preview {
    ContentView()
}
