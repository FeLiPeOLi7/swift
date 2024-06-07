//
//  Desafio2.swift
//  Aula01UFES
//
//  Created by Turma02-8 on 06/06/24.
//

import SwiftUI

struct Desafio2: View {
    var body: some View {
        Spacer()
        HStack{
            Image("img")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .padding(.leading)
            Spacer()
            VStack(spacing: 10){
                Text("HackaTruck")
                    .foregroundColor(.red)
                Text("77 Universidades")
                    .foregroundColor(.blue)
                Text("5 Regiões do Brasil")
                    .foregroundColor(.yellow)
            }
            Spacer()
        }
        Spacer()
    }
}

#Preview {
    Desafio2()
}
