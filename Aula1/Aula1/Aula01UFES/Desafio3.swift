//
//  Desafio3.swift
//  Aula01UFES
//
//  Created by Turma02-8 on 06/06/24.
//

import SwiftUI

struct Desafio3: View {
    var body: some View {
        VStack{
            HStack(alignment: .center){
                ZStack(alignment: .bottomTrailing){
                    Image("img")
                        .resizable()
                        .clipShape(Circle())
                        .padding(.leading)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                    ZStack{
                        Circle()
                            .foregroundColor(.white)
                            .frame(width: 30, height: 30)
                        Circle()
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .frame(width: 20, height: 20)
                        Rectangle()
                            .frame(width: 12, height:3)
                            .foregroundColor(.white)
                        Rectangle()
                            .frame(width: 3, height:12)
                            .foregroundColor(.white)
                    }
                }
                Spacer()
                VStack{
                    HStack{
                        VStack{
                            Text("8")
                            Text("Post")
                        }
                        Spacer()
                        VStack{
                            Text("12k")
                            Text("Seguidores")
                        }
                        Spacer()
                        VStack{
                            Text("2k")
                            Text("Seguindo")
                        }
                        Spacer()
                    }
                    HStack{
                        Button("Editar Perfil") {
                                                
                        }
                                                    .buttonStyle(.bordered)
                                                    .padding(.leading, 48.0)
                                            
                        Spacer()
                    }
                    
                        
                }
            }
            HStack{
                VStack{
                    Text("Nome Sobrenome")
                        .bold()
                    Text("Lorem ipsum e talz")
                }
                .padding(.leading)
                Spacer()
            }
            HStack{
                Image("mopt")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading)
                Spacer()
                Image("conf")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading)
                Spacer()
                Image("person")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading)
                Spacer()
            }
            Spacer()
            VStack{
                HStack{
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.leading)

                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                    
                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.trailing)
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.leading)
                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.trailing)
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.leading)

                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.trailing)
                    Spacer()
                }
                HStack{
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.leading)
                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                    Spacer()
                    Rectangle()
                        .frame(width: 120, height: 120)
                        .padding(.trailing)
                    Spacer()
                }
            }
            Spacer()
            //Pagina centra
        }
    }
}

#Preview {
    Desafio3()
}
