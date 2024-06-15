//
//  Tela2.swift
//  Aula04_2_UFES
//
//  Created by Turma02-8 on 11/06/24.
//

import SwiftUI

struct Tela2: View {
    var body: some View {
        ZStack{
            Color.purple
                .ignoresSafeArea()
            Rectangle()
                .frame(width:200, height:100)
                .foregroundColor(.pink)
            Text("Nome: Tiago\nSobrenome:Pereira")
        }
    }
}

#Preview {
    Tela2()
}
