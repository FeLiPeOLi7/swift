//
//  CreateUser.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct CreateUser: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false
    @State private var showCreateUserSheet = false
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
                    
                        Button(action: {
                            userManager.createUser(u: User(username: user.username, password: user.password))
                        }) {
                            Text("Registrar-se")
                            .frame(width: 160, height: 50)
                            .background(.white)
                            .cornerRadius(10)
                            .foregroundColor(.principal)
                            .bold()
                        }
                    
                }
                .padding(22)
                Spacer()
            }
            .background(.principal)
            .onAppear() {
                userManager.fetchUsers()
            }
        }
    }
}

#Preview {
    CreateUser(userManager: UserManager())
}
