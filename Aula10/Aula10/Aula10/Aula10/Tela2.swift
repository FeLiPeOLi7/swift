//
//  Tela2.swift
//  Aula10
//
//  Created by Turma02-8 on 19/06/24.
//

import SwiftUI

struct Tela2: View {
    var p: Personagem
    var body: some View {
        AsyncImage(url: URL(string: p.foto!)) { image in
            image
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        } placeholder: {
            Color.red
        }
        .frame(width: 200, height: 200)
        Text("Nome: \(p.nomePersonagem!)")
        Text("Apelido: \(p.apelido!)")
        Text("Nome Navio: \(p.nomeNavio!)")
        Text("Idade: \(p.idade!)")
        Text("Bando: \(p.bando!)")
        VStack{
            Text("Hakis:")
            ForEach(p.hakis!, id: \.self){h in
                Text(h)
            }
        }
    }
}
