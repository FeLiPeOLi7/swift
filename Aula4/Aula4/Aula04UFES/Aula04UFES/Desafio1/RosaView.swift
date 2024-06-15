//
//  RosaView.swift
//  Aula04UFES
//
//  Created by Turma02-8 on 11/06/24.
//

import SwiftUI

struct RosaView: View {
    var body: some View {
        ZStack{
            Rectangle()
                .frame(width:400, height:800)
                .padding(.top, -90)
                .foregroundColor(.pink)
            Circle()
                .frame(width:300)
            Image(systemName: "paintbrush")
                .resizable()
                .scaledToFit()
                .frame(width:200, height:200)
                .foregroundColor(.pink)
        }
    }
}

#Preview {
    RosaView()
}
