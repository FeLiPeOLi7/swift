//
//  Tela2.swift
//  Aula5
//
//  Created by Turma02-8 on 12/06/24.
//

import SwiftUI

struct Tela2: View {
    var nameReceived: String
    var body: some View {
        Text("Segunda TELA! \(nameReceived)")
    }
}

#Preview {
    Tela2(nameReceived: "FELIPE PREVIEW")
}
