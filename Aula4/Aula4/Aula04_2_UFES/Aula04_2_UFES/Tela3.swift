//
//  Tela3.swift
//  Aula04_2_UFES
//
//  Created by Turma02-8 on 11/06/24.
//

import SwiftUI


struct Tela3: View {
    @State private var name = "Fulano"
    var body: some View {
        NavigationStack{
            ZStack{
                Color.purple
                    .ignoresSafeArea()
                Rectangle()
                    .frame(width:200, height:200)
                    .foregroundColor(.pink)
                    .cornerRadius(10)
                VStack(alignment: .center){
                    TextField("Enter your name", text: $name)
                        .multilineTextAlignment(.center)
                    Text("Bem-vindo, \(name)")
                    NavigationLink(destination: Tela4(nameReceived: name)){
                        Text("Acessar Tela")
                            .border(.blue)
                            .foregroundColor(.white)
                            .background(.blue)
                            .cornerRadius(10)
                            .frame(width:90)
                    }
                }
            }
        }
    }
}

#Preview {
    Tela3()
}
