//
//  HomeView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct ProfileView: View {
    @State var profile: Profile
    @StateObject var membershipManager = MembershipManager()
    @StateObject var userAchievementManager = UserAchievementManager()
    @State private var challenges: [Challenge] = []
    @State private var achievements: [Achievement] = []
    func statusChallenge(status: Int) -> String {
        let status =
            if status == 1 { "Ativo" }
            else if status == 2 { "Finalizado" }
            else if status == 3 { "Pausado" }
            else { "ERROR" }
        return status
    }

    @State var statusChallenge = 1
    
//    var postMock = Post(profile: Profile(firstName: "Alberto", lastName: "De Nobrega", bio: "A vida é bela", profilePictureURL: "https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg", currentStreak: 4, maximumStreak: 6, totalDone: 23), img: "https://macaetips.com/wp-content/uploads/2023/07/clube-do-livro-macae.jpg", likes: 3, description: "post post")
    
    var profileMock = Profile(firstName: "Alberto", lastName: "De Nobrega", bio: "A vida é bela", profilePictureURL: "https://www.wilsoncenter.org/sites/default/files/media/images/person/james-person-1.jpg", currentStreak: 4, maximumStreak: 6, totalDone: 23)
    
    
    var body: some View {
        VStack {
            HStack {
                AsyncImage(url: URL(string: profile.profilePictureURL ?? profileMock.profilePictureURL!)) { image in
                    image
                        .resizable()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                    
                } placeholder: {
                    ProgressView()
                }
                Text(profile.firstName)
                Spacer()
                HStack {
                    VStack {
                        Text("Current Streak")
                        Circle()
                            .stroke(Color.principal, lineWidth: 1)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(profile.currentStreak != nil ? "\(profile.currentStreak!)" : "\(profileMock.currentStreak!)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                            )
                    }
                    VStack {
                        Text("Max Streak")
                        Circle()
                            .stroke(Color.principal, lineWidth: 1)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(profile.maximumStreak != nil ? "\(profile.maximumStreak!)" : "\(profileMock.maximumStreak!)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                            )
                    }
                    VStack {
                        Text("Total Done")
                        Circle()
                            .stroke(Color.principal, lineWidth: 1)
                            .frame(width: 40, height: 40)
                            .overlay(
                                Text(profile.totalDone != nil ? "\(profile.totalDone!)" : "\(profileMock.totalDone!)")
                                    .foregroundColor(.black)
                                    .font(.system(size: 15))
                            )
                    }
                    
                }
                .font(.system(size: 10))
                
                
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 1))
            
            Spacer()
            Text(" ")
            Text(" ")

            Text("Grupos criados por voce")
                .padding(.leading, -120)
                .font(.system(size: 20))
                .bold()
            
            
            ScrollView {
            ForEach(membershipManager.challengesFromProfile(profile: profile), id: \.self) { challenge in
                NavigationLink(destination: ChallengeDetails(challenge: challenge)){
                    VStack{
                        HStack{
                            
                            AsyncImage(url: URL(string: challenge.picture_URL ?? profileMock.profilePictureURL!)){
                                image in image
                                    .resizable()
                                    .frame(width: 100, height:86)
                                    .scaledToFit()
                                    .cornerRadius(12)
                            }placeholder: {ProgressView()}
                            
                            VStack(alignment: .leading){
                                Spacer()
                                HStack{
                                    Text(challenge.name)
                                        .bold()
                                        .font(.system(size: 18))
                                        .foregroundColor(.principal)
                                    Spacer()
                                    HStack{
                                        Text(statusChallenge(status: statusChallenge))
                                        Circle()
                                            .frame(width: 10)
                                    }
                                    .foregroundStyle((statusChallenge == 1) ? .green : .red)
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
            Spacer()
          
            VStack {
                ScrollView(.horizontal) {
                    ForEach(userAchievementManager.userAchievements, id: \.self) { u in
                        
                        Circle()
                            .stroke(u.profile.firstName == profile.firstName ? Color.principal : Color.gray, lineWidth: 2)
                            .frame(width: 50, height: 50)
                            .overlay(
                                Text("\(u.achievement.cont)")                                    .foregroundColor(.black)
                            )

                        
                    }
                }
            }
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 16).stroke(.principal, lineWidth: 1))
            
            
        }
        .padding()
        .onAppear() {
            userAchievementManager.fetchUserAchievements()
            membershipManager.fetchMemership()
            challenges = membershipManager.challengesFromProfile(profile: profile)
            achievements = userAchievementManager.achievementFromProfile(profile: profile)
        }
    }
    
}

#Preview {
    ProfileView(profile: Profile(firstName: "B"))
}
