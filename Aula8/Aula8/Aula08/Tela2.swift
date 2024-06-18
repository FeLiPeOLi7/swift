//
//  Tela2.swift
//  Aula08
//
//  Created by Turma02-8 on 14/06/24.
//

import SwiftUI

struct Tela2: View {
    var m : Marca
    @StateObject var vm = ViewModel()
    var body: some View {
        Text(m.codigo!)
        List(vm.tipo_modelos, id: \.self){ mod in
            NavigationLink(destination: Tela3(m:m, mod:mod)){
                Text("\(mod.nome!)")
            }
        }.onAppear(){
            vm.fetchModelos(mId: m.codigo!)
        }
    }
}

//#Preview {
//    Tela2()
//}
