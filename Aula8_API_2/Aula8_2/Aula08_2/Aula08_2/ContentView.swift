//
//  ContentView.swift
//  Aula08_2
//
//  Created by Turma02-8 on 18/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    var body: some View {
        NavigationStack{
            Text("Vagas de Emprego")
            List(vm.jobs, id: \.self){v in
                NavigationLink(destination: Tela2(v: v)){
                    Text(v.title!)
                }
            }.onAppear(){
                vm.fetchJobs()
            }
        }
    }
}

#Preview {
    ContentView()
}
