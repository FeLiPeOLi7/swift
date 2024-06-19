//
//  Tela2.swift
//  Aula08_2
//
//  Created by Turma02-8 on 18/06/24.
//

import SwiftUI

struct Tela2: View {
    var v: Vaga
    var body: some View {
        ScrollView{
            VStack{
                Text(v.company_name!)
                if v.remote!{
                    Text("Remoto")
                }else{
                    Text("Presencial")
                }
                Text(v.location!)
                Text("\(v.created_at!)")
                Text(v.slug!)
                ForEach(v.job_types!, id: \.self){jt in
                    VStack{
                        HStack{
                            Text("Tipo da vaga: ")
                            Text(jt)
                        }
                    }
                }
                ForEach(v.tags!, id: \.self){t in
                    VStack{
                        HStack{
                            Text("Tags: ")
                            Text(t)
                        }
                    }
                }
                Text(v.description!)
            }
        }
    }
}

