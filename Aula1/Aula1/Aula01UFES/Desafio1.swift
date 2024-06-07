//
//  Desafio1.swift
//  Aula01UFES
//
//  Created by Turma02-8 on 06/06/24.
//

import SwiftUI

struct Desafio1: View {
    var body: some View {
        VStack{
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.red)
                    .padding()
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .padding()

            }
            Spacer()
            HStack{
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .padding()
                Spacer()
                Rectangle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.yellow)
                    .padding()
            }
        }
    }
}

#Preview {
    Desafio1()
}
