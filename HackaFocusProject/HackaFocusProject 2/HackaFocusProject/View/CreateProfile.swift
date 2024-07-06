//
//  CreateUser.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct CreateProfile: View {
    @Environment(\.dismiss) var dismiss
    
    @State var user: User
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var bio: String = ""
    @State private var profilePictureURL: String = ""

    @ObservedObject private var userManager = UserManager()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                ZStack {
                    Image("logo2")
                        .resizable()
                        .clipShape(Circle())
                    AsyncImage(url: URL(string: profilePictureURL)) {
                        result in
                        result.image?
                            .resizable()
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                    }
                }
                .frame(width: 250, height: 250)
                .overlay(
                    Circle()
                        .stroke(.gray, lineWidth: 2)
                )
//                .frame(width: 350, height: 300)
                
                Spacer()
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.white)
                        .frame(width: 350, height: 35)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: 2)
                        )
                    HStack(spacing: 0) {
                        TextField(
                            "URL da imagem",
                            text: $profilePictureURL
                        )
                        .padding()
                        .frame(width: 285, height: 35)
                        
                        PasteButton(payloadType: String.self) { urls in
                            guard let picture_URL = urls.first else { return }
                            self.profilePictureURL = profilePictureURL
                        }
                        .labelStyle(.iconOnly)
                        .tint(.red)
                        //                    .buttonBorderShape(.capsule)
                        //                    .frame(width: 80)
                        //                    .padding(.leading, 20)
                        .padding(.trailing, 15)
                    }
                }
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 172, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 2)
                            )
                        HStack(spacing: 0) {
                            TextField(
                                "Nome",
                                text: $firstName
                            )
                            .padding()
                            .frame(width: 172, height: 35)
                            
                        }
                    }
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(.white)
                            .frame(width: 172, height: 35)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.gray, lineWidth: 2)
                            )
                        HStack(spacing: 0) {
                            TextField(
                                "Sobrenome",
                                text: $lastName
                            )
                            .padding()
                            .frame(width: 172, height: 35)
                            
                        }
                    }
                }
                .frame(width: 350, height: 35)
                
                TextField(
                    "Bio (opcional)",
                    text: $bio,
                    axis: .vertical
                )
                .padding()
                .frame(width: 350, height: 105, alignment: .top)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 2)
                )
                
                Spacer()
                Spacer()
                
                Button(action: {
                    user.profile = Profile(firstName: firstName, lastName: lastName, bio: bio, profilePictureURL: profilePictureURL, currentStreak: 0, maximumStreak: 0, totalDone: 0, joinedDate: "03/07/2024");
                    userManager.editUser(user: user);
                    dismiss()
                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(width: 140, height: 50)
                            .foregroundColor(.orange)
                        Text("Criar Conta")
                            .foregroundColor(.white)
                            .bold()
                    }
                }
                
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    CreateProfile(user: User(username: "aaa", password: "000"))
}
