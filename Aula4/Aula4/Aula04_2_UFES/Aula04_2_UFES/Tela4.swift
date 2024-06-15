//
//  Tela4.swift
//  Aula04_2_UFES
//
//  Created by Turma02-8 on 12/06/24.
//

import SwiftUI

struct Tela4: View {
    @State var nameReceived: String
    var body: some View {
        ZStack{
            Color.purple
                .ignoresSafeArea()
            Rectangle()
                .frame(width:200, height:200)
                .foregroundColor(.pink)
                .cornerRadius(10)
            Text("Volte, \(nameReceived)")
        }
    }
}

#Preview {
    Tela4(nameReceived: "Preview")
}
