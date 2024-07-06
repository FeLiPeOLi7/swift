//
//  ContentView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct ChallengeView: View {
    @State var profile: Profile
    var profileMock: Profile = Profile(firstName: "Nal", lastName: "Do", bio: "Canal", profilePictureURL: "https://blog-static.petlove.com.br/wp-content/uploads/2017/07/adotar-um-gatinho-1.jpg", currentStreak: 0, maximumStreak: 0, totalDone: 0, joinedDate: "")
    @State var challenge: Challenge
    @StateObject var postManager = PostManager()
    @Environment (\.dismiss) var dismiss

    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(destination: ChallengeDetails(challenge: challenge)) {
                    Text(challenge.name)
                        .foregroundColor(.principal)
                        .font(.system(size: 20))
                }
                Spacer()
                
                ZStack {
                    Image(systemName: "photo")
                        .foregroundColor(.principal)
                    if challenge.picture_URL != nil{
                        AsyncImage(url: URL(string: challenge.picture_URL!)) {
                            result in
                            result.image?
                                .resizable()
                                .frame(width: 350, height: 200)
                                .clipShape(RoundedRectangle(cornerRadius: 15.0))
                        }
                    }
                }
                .frame(width: 350, height: 200)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.principal, lineWidth: 2)
                )
                
                HStack {
                    NavigationLink(destination: ChallengeDetails(challenge: challenge)) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .foregroundColor(.white)
                            VStack {
                                Spacer()
                                HStack {
                                    Image(systemName: "books.vertical")
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .foregroundColor(.principal)
                                }
                                Spacer()
                                Text("Detalhes do Grupo")
                                    .foregroundColor(.principal)
                                Spacer()
                            }
                        }
                    }
                    .frame(height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.principal, lineWidth: 2)
                    )
                    
                    Spacer()
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundColor(.white)
                        VStack {
                            Spacer()
                            HStack {
                                Image(systemName: "calendar")
                                    .resizable()
                                    .frame(width: 25, height: 25)
                                    .foregroundColor(.principal)
                                Text("\(10)")
                                    .foregroundStyle(.principal)
                                    .font(.title)
                            }
                            Spacer()
                            Text("Dias restantes")
                                .foregroundColor(.principal)
                            Spacer()
                        }
                        .bold()
                    }
                    .frame(height: 80)
                    .overlay(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(.principal, lineWidth: 2)
                    )
                }
                .frame(width: 350)
                
                VStack {
                    ScrollView{
                        ForEach(postManager.fetchFiltrado(challengeId:challenge.name), id:\.self) {
                                post in
                                NavigationLink(destination: PostView(post: post)){
                                VStack {
                                    HStack{
                                        ZStack{
                                            
                                            VStack {
                                                Spacer()
                                                Image(systemName: "photo")
                                                    .foregroundColor(.gray)
                                                Spacer()
                                            }
                                            .frame(width: 40, height: 40)
                                            .background(.white)
                                            .clipShape(Circle())
                                            
                                            if(profile.profilePictureURL != nil){
                                                AsyncImage(url: URL(string: profile.profilePictureURL!)) {
                                                    result in
                                                    result.image?
                                                        .resizable()
                                                }
                                                .frame(width:40, height:40)
                                                .clipShape(Circle())
                                            }
                                        }
                                        Text(profile.firstName)
                                            .foregroundColor(.black)
                                        Spacer()
                                    }
                                    ZStack {
                                        VStack {
                                            Spacer()
                                            Image(systemName: "photo")
                                                .foregroundColor(.gray)
                                            Spacer()
                                        }
                                        .frame(width: 350, height: 300)
                                        .background(.white)
                                        
                                        if(post.img != nil){
                                            AsyncImage(url: URL(string: post.img!)) {
                                                result in
                                                result.image?
                                                    .resizable()
                                            }
                                            .frame(width: 350, height: 300)
                                            .clipShape(Rectangle())
                                        }
                                    }
                                    .overlay(
                                        Rectangle()
                                            .stroke(.orange, lineWidth: 2)
                                    )
                                    
                                    Spacer()
                                    
                                    HStack {
                                        Text(post.description)
                                        //                                    .foregroundStyle(.orange)
                                        Spacer()
                                    }
                                    .padding(.leading, 10)
                                    
                                    Spacer()
                                }
                                .frame(width: 350, height: 400)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(.orange, lineWidth: 2)
                                )
                                .padding(.top, 5)
                            }
                        }
                    }
                }
            }
            .onAppear() {
                postManager.fetchPosts()
            }
            
            NavigationLink(destination: CreatePost(challengeId: challenge.name)) {
                Text("Criar Post")
            }
        }
    }
        
}

#Preview {
    ChallengeView(profile: Profile(firstName: "", lastName: "", bio: "", currentStreak: 0, maximumStreak: 0, totalDone: 0, joinedDate: ""),challenge: Challenge(_id: "111111", name: "Teste"))
}
