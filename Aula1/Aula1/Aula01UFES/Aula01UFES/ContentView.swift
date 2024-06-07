//
//  ContentView.swift
//  Aula01UFES
//
//  Created by Turma02-8 on 06/06/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Spacer()
            HStack{
                Text("Hello, Felipe!")
                    .bold()
                Text("Faça Login:").bold()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
