//
//  HomeView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct Profile: View {
    @State var profile: Profile
    @State private var membershipManager = MembershipManager()
    @State private var userAchievementManager = UserAchievementManager()
    @State private var challenges = membershipManager.challengesFromProfile(profile)
    @State private var achievements = userAchievementManager.AchievementFromProfile(profile)
    
    var body: some View {
        Text(profile.firstName)

        List(challenges) { challenge in
            if(challenge.role == "ADM") {
                Text(challenge.name)
            }
        }

        List(achievements) { achievement in
            Text(achievement.count)
        }
    }
}

#Preview {
    Profile(Profile(firstName: "Saruel"))
}
