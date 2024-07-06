//
//  ContentView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct ChallengeDetails: View {
    @State var challenge: Challenge
    @StateObject var membershipManager = MembershipManager()
    @State var challengeMock = Challenge(name: "Grupo de Leitura", description: "É com grande alegria que damos as boas-vindas a este grupo de leitura no WhatsApp! Aqui, vamos mergulhar juntos em um mundo de histórias fascinantes, personagens inesquecíveis e reflexões profundas.", picture_URL: "https://macaetips.com/wp-content/uploads/2023/07/clube-do-livro-macae.jpg")
    
    var body: some View {
        VStack {
            // Button(destination: EditChallenge(challenge))
          
            AsyncImage(url: URL(string: challenge.picture_URL ?? challengeMock.picture_URL!)) { image in
                image
                    .resizable()
                    .frame(width: 300, height: 180)
                    .clipShape(Circle())
                    
            } placeholder: {
                ProgressView()
            }
            Text(challenge.name)
                .font(.system(size: 30))
                .foregroundStyle(.principal)

            
           ScrollView {
               ForEach(membershipManager.memberships, id: \.self) { membership in
//                    if(membership.challenge.name == challenge.name) {
                        HStack {
                            AsyncImage(url: URL(string: membership.profile.profilePictureURL ?? challengeMock.picture_URL!)) { image in
                                image
                                    .resizable()
                                    .frame(width: 50, height: 50)
                                    .clipShape(Circle())
                                    
                            } placeholder: {
                                ProgressView()
                            }
                            Text(membership.profile.firstName)
                            Spacer()
                            Circle()
                                .stroke(Color.principal, lineWidth: 1)
                                    .frame(width: 40, height: 40)
                                    .overlay(
                                        
                                        Text(membership.currentStreak != nil ? "\(membership.currentStreak!)" : "\(7)")
                                            .foregroundColor(.black)
                                            
                                    )
                            
                        }
                        .padding()
                        
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 1))
                        
                        
//                    }
                    
                }
            }
        }
        .onAppear() {
            membershipManager.fetchMemership()
        }
        .padding()
    }
}

#Preview {
    ChallengeDetails(challenge: Challenge(name: "Teste"))
}
