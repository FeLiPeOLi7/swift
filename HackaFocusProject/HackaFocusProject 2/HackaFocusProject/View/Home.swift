//
//  HomeView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct PostCanvas: View{
    var p: Post
    @State var like: String = "heart"
    var body: some View{
        ZStack{
            Rectangle()
                .border(.orange/*.principal*/)
                .frame(width: 300, height:300)
                .cornerRadius(10)
            VStack{
                AsyncImage(url: URL(string: p.img!)) { image in
                    image
                        .resizable()
                        .clipShape(Circle())
                } placeholder: {
                    Color.red
                }
                .frame(width: 200, height: 200)
                .padding(.leading)
                Text(p.description)
                HStack{
                    Button{
                        like = "heart.fill"
                    }label:{
                        Image(systemName: like)
                    }
                    
                    Button{
                        
                    }label:{
                        Image(systemName: "text.bubble.fill")
                    }
                }
            }
        }
    }
}

struct Home: View {
    @State var user: User
    @StateObject var membershipManager = MembershipManager()
    @State var challenges: [Challenge] = []
    @StateObject var postManager = PostManager()
    @State private var isLiked = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(.vertical){
                    
//                        Text(c.challenge.name)
                            ForEach(postManager.posts, id: \.self._id) { post in
//                                VStack {
//                                    if(post.id_challenge == c.challenge.name) {
//                                        NavigationLink(destination: PostView(post: post)) {
//                                            Text(post.description)
//                                        }
//                                    }
//                                }
                                VStack {
                                    VStack{
                                        HStack{
                                            AsyncImage(url: URL(string: "https://i.ytimg.com/vi/pom6RwxXCyY/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGHIgRyg7MA8=&rs=AOn4CLAtgyK2D6WCoe6_kyOKfbBFlb_sDg")){
                                                image in image
                                                    .resizable()
                                                    .frame(width: 30, height:30)
                                                    .scaledToFit()
                                                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                                            }placeholder: {ProgressView()}
                                            Text("Marcio publicou em")
                                            
                                            Spacer()
                                            Text("21/06 12h30")
                                        }.font(.system(size: 12))
                                        NavigationLink(destination: PostView(post: post)) {
                                            AsyncImage(url: URL(string: "https://i.ytimg.com/vi/pom6RwxXCyY/maxresdefault.jpg?sqp=-oaymwEmCIAKENAF8quKqQMa8AEB-AH-CYAC0AWKAgwIABABGHIgRyg7MA8=&rs=AOn4CLAtgyK2D6WCoe6_kyOKfbBFlb_sDg")){
                                                image in image
                                                    .resizable()
                                                    .frame(height:300)
                                                    .scaledToFill()
                                            }placeholder: {ProgressView()}
                                        }
                                        HStack{
                                            Text("Leitura diária de hj! 📖 ")
                                            Spacer()
                                        }
                                        .padding(.vertical)
                                        HStack{
                                            Toggle(isOn: $isLiked){
                                                //dado.isLiked.self = true
                                                Image(systemName: isLiked ? "heart.fill" : "heart")
                                                    .font(.system(size: 28))
                                                Text("3")
                                            }
                                            .tint(.white)
                                            .toggleStyle(.button)
                                            //.clipShape(Circle())
                                            
                                            
                                            //Image(systemName: "\(like)")
                                            //    .font(.system(size: 28))
                                            HStack{
                                                Image(systemName: "text.bubble.rtl")
                                                    .font(.system(size: 28))
                                                Text("33")
                                                    .font(.system(size: 18))
                                            }
                                            .font(.system(size: 28))
                                            Spacer()
                                            Image(systemName: "eye")
                                                .font(.system(size: 28))
                                        }
                                        .foregroundColor(.principal)
                                    }
                                }
                                    .frame(maxWidth: .infinity,minHeight: 400)
                                    .cornerRadius(12)
                                    .padding()
                                    .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 2))
                                }
                                
                            
                        }
                    }
                    .padding()
                    .onAppear() {
                        membershipManager.fetchMemership()
                        challenges = membershipManager.challengesFromProfile(profile: user.profile!)
                        postManager.fetchPosts()
                    }
                }
                
            }
            
        }

#Preview {
    Home(user: User(username: "AA", profile: Profile(firstName: "teste"), password: "AA"))
}
