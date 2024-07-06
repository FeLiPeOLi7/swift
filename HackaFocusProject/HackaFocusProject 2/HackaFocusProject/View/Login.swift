//
//  Login.swift
//  HackaFocus
//
//  Created by Turma02-5 on 25/06/24.
//

import SwiftUI

struct Login: View {
    @ObservedObject var userManager = UserManager()
    @State private var dontHasProfile = false
    @State private var hasProfile = false
    @State private var user = User(username: "B", password: "B")
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack{
                    ZStack{
                        ZStack{
                            Image("DefaultProfilePicture")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 200)
                        }
                        .frame(width: 300, height: 300)
                        .background(.white)
                        .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    }
                    .frame(width: 350, height: 350)
                    .background(.principal)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                }
                .ignoresSafeArea()
                .frame(width: 400, height: 400)
                .background(.white)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                
                Text("HackaFocus")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.principal, lineWidth: 2)
                            )
                        HStack(spacing: 0) {
                            TextField(
                                "username",
                                text: $user.username
                            )
                            .padding()
                            .frame(width: 350, height: 35)
                            .foregroundStyle(.principal)
                            .bold()
                            
                        }
                    }
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 350, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.principal, lineWidth: 2)
                            )
                        HStack(spacing: 0) {
                            TextField(
                                "password",
                                text: $user.password
                            )
                            .padding()
                            .frame(width: 350, height: 35)
                            .foregroundStyle(.principal)
                            .bold()
                            
                        }
                    }
                    HStack {
                        
                        
                        Button(action: {
                            if let user2 = userManager.autenticateUser(username: user.username, password: user.password) {
                                self.user = user2
                                
                                if(user.profile == nil) {
                                    dontHasProfile = true
                                } else {
                                    hasProfile = true
                                }
                                
                            } else {
                                print("Nao autenticado")
                            }
                        }) {
                            Text("Entrar")
                            .frame(width: 100, height: 50)
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundColor(.principal)
                            .bold()
                        }
                        
                        Spacer()
                        
                        //                List(userManager.getUsers(), id: \.self._id) { user in
                        //                    Text(user.username)
                        //                }
                        
                        NavigationLink(destination: CreateUser(userManager: userManager)) {
    //                        ZStack {
    //                            RoundedRectangle(cornerRadius: 10)
    //                                .frame(width: 140, height: 35)
    //                                .foregroundColor(.orange)
                                Text("Registrar-se")
                                .frame(width: 160, height: 50)
                                .background(.white)
                                .cornerRadius(10)
                                .foregroundColor(.principal)
                                .bold()
    //                        }
                        }
                        
                    }
                }
                .padding(22)
                Spacer()
                
//                    TextField("username", text: $user.username)
//                    .autocapitalization(.none)
//                    TextField("password", text: $user.password)
//                    .autocapitalization(.none)
                    
                
                
                NavigationLink(destination: ContentView(user: user), isActive: $hasProfile) {
                    EmptyView()
                }
                .hidden()
                
                NavigationLink(destination: CreateProfile(user: user), isActive: $dontHasProfile) {
                    EmptyView()
                }
                .hidden()


            }
            .background(.principal)
            .onAppear() {
                userManager.fetchUsers()
            }
        }
    }
}

#Preview {
    Login()
}
