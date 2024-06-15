//
//  ContentView.swift
//  Aula5
//
//  Created by Turma02-8 on 12/06/24.
//

import SwiftUI

struct ContentView: View {
    @State var name: String = ""
    var body: some View {
        NavigationStack{
            VStack {
                Text("Hello, world! \(name)")
                TextField("Nome", text: $name)
                
                NavigationLink(destination: Tela2(nameReceived: name)){
                    Text("Ir")
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
