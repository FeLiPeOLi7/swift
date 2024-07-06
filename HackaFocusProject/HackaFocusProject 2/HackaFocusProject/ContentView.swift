//
//  ContentView.swift
//  HackaFocusProject
//
//  Created by Turma01-27 on 01/07/24.
//

import SwiftUI

struct ContentView: View {
    @State var user: User
    var body: some View {
        // Notification Icon
        HStack{
            Text("HackaFocus")
                .bold()
                .foregroundStyle(.principal)
            Spacer()
            NavigationLink(destination: NotificationView()){
                Image(systemName: "bell.badge")
                    .font(.system(size: 30))
                    .foregroundColor(.principal)
            }
        }
        .padding(.horizontal)

        
        TabView {
            Home(user: user)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            MyChallenges(profile: user.profile!)
                .tabItem {
                    Label("MyChallenges", systemImage: "star")
                }
            CreateChallenge(profile: user.profile!)
                .tabItem {
                    Label("Create Challenge", systemImage: "list.dash")
                }
            ProfileView(profile: user.profile!)
                .tabItem {
                    Label("Profile", systemImage: "star")
                }
            

        }
        .accentColor(.principal)
    }
}

#Preview {
    ContentView(user: User(username: "Teste", profile: Profile(firstName: "teste"), password: "teste"))
}
