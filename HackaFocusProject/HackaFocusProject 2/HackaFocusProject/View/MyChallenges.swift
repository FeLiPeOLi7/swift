//
//  HomeView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct MyChallenges: View {
    @State var profile: Profile
    @StateObject private var membershipManager = MembershipManager()
    @State private var challenges: [Challenge] = []
    func statusChallenge(status: Int) -> String {
        let status =
            if status == 1 { "Ativo" }
            else if status == 2 { "Finalizado" }
            else if status == 3 { "Pausado" }
            else { "ERROR" }
        return status
    }
    @State var statusChallenge = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(){
                    ForEach(membershipManager.memberships , id: \.self) { m in
                        NavigationLink(destination: ChallengeView(profile: profile, challenge: m.challenge)){
                            VStack{
                                HStack{
                                    if m.challenge.picture_URL != nil{
                                        AsyncImage(url: URL(string: m.challenge.picture_URL!)){
                                            image in image
                                                .resizable()
                                                .frame(width: 100, height:86)
                                                .scaledToFit()
                                                .cornerRadius(12)
                                        }placeholder: {ProgressView()}
                                    }
                                    VStack(alignment: .leading){
                                        Spacer()
                                        HStack{
                                            Text(m.challenge.name)
                                                .bold()
                                                .font(.system(size: 18))
                                                .foregroundColor(.principal)
                                            Spacer()
                                            HStack{
                                                Text(statusChallenge(status: statusChallenge))
                                                Circle()
                                                    .frame(width: 10)
                                            }
                                            .foregroundStyle(statusChallenge == 1 ? .green : .red)
                                            .font(.system(size: 12))
                                        }
                                        Spacer()
                                        Text("Aqui ficará uma pequena descriçao do grupo")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Text("01/06/24 -> 30/06/24")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.gray)
                                        Spacer()
                                    }
                                    Spacer()
                                }
                                .frame(height: 90)
                            }
                            .frame(maxWidth: .infinity,minHeight: 60)
                            .cornerRadius(12)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 2))
                        }
                        }
                    }
                }
            .padding()
                .onAppear() {
                    membershipManager.fetchMemership()
                }
            }
        }
    }

#Preview {
    MyChallenges(profile: Profile(firstName: "D"))
}
    
/*
 import SwiftUI
 import UIKit

 struct GroupsView: View {
     @StateObject var instVM = testeAPI()
     func statusChallenge(status: Int) -> String {
         let status =
             if status == 1 { "Ativo" }
             else if status == 2 { "Finalizado" }
             else if status == 3 { "Pausado" }
             else { "ERROR" }
         return status
     }
     @State var statusChallenge = 1
     
     
     
     var body: some View {
         NavigationStack{
             VStack{
                 ScrollView(.vertical){
                     ForEach(instVM.profiles, id: \.self){ dado in
                         VStack{
                                 HStack{
                                     AsyncImage(url: URL(string: dado.profilePictureURL)){
                                         image in image
                                             .resizable()
                                             .frame(width: 100, height:86)
                                             .scaledToFit()
                                             .cornerRadius(12)
                                     }placeholder: {ProgressView()}
                                     VStack(alignment: .leading){
                                         Spacer()
                                         HStack{
                                             Text("Título do grupo")
                                                 .bold()
                                                 .font(.system(size: 18))
                                             Spacer()
                                             HStack{
                                                 Text(statusChallenge(status: statusChallenge))
                                                 Circle()
                                                     .frame(width: 10)
                                             }
                                             .foregroundStyle(statusChallenge == 1 ? .green : .red)
                                             .font(.system(size: 12))
                                         }
                                         Spacer()
                                         Text("Aqui ficará uma pequena descriçao do grupo")
                                         Spacer()
                                         Text("01/06/24 -> 30/06/24")
                                             .font(.system(size: 14))
                                             .foregroundStyle(.gray)
                                         Spacer()
                                     }
                                     Spacer()
                                 }
                                 .frame(height: 90)
                         }
                         .frame(maxWidth: .infinity,minHeight: 60)
                         .cornerRadius(12)
                         .padding()
                         .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 2))
                     }
                 }
             }
             .padding()
         }
     }
 }

 #Preview {
     GroupsView()
 }

 
 
 ForEach(membershipManager.memberships , id: \.self) { m in
     if m.challenge._id != nil {
         NavigationLink(destination: ChallengeView(challenge: m.challenge)) {
             Text(m.challenge.name)
         }
     }
 */
