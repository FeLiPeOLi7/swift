//
//  Tela3.swift
//  Aula08
//
//  Created by Turma02-8 on 17/06/24.
//

import SwiftUI

struct Tela3: View {
    var m: Marca
    var mod : Modelo
    @StateObject var vm = ViewModel()
    var body: some View {
        Text(mod.nome!)
        List(vm.tipo_anos, id: \.self){ a in
            NavigationLink(destination: Tela4(m: m, mod: mod, ano: a)){
                Text("\(a.nome!)")
            }
        }.onAppear(){
            vm.fetchAno(mId: m.codigo!, aId: mod.codigo!)
        }
    }
}

/*
#Preview {
    Tela3()
}
*/
