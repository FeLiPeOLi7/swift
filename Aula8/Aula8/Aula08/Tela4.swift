//
//  Tela4.swift
//  Aula08
//
//  Created by Turma02-8 on 17/06/24.
//

import SwiftUI

struct Tela4: View {
    var m: Marca
    var mod: Modelo
    var ano: Ano
    @StateObject var vm = ViewModel()
    var body: some View {
        VStack{
            Text(mod.nome!)
            if let valor = vm.singleObject?.Valor {
                Text("\(valor)")
            }else{
                Text("Valor indisponível")
            }
        }.onAppear(){
            vm.fetchPrice(mId: m.codigo!, aId: mod.codigo!, anId: ano.codigo!)
        }
    }
}

//#Preview {
    //Tela4()
//}
