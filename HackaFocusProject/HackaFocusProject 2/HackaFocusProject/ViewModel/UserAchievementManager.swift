//
//  VMUserAchievement.swift
//  HackaFocus
//
//  Created by Turma02-5 on 24/06/24.
//

import Foundation
import Combine

class UserAchievementManager: ObservableObject {
    @Published var userAchievements: [UserAchievement] = []

    func fetchUserAchievements() {
        guard let url = URL(string: "http://127.0.0.1:1880/userAchievements") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print("No data returned: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let userAchievementsResponse = try JSONDecoder().decode([UserAchievement].self, from: data)

                DispatchQueue.main.async {
                    self?.userAchievements = userAchievementsResponse
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
    
    func createUserAchievement(userAchievement: UserAchievement){
        let url = URL(string: "http://127.0.0.1:1880/postUserAchievement")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(userAchievement)
        
        request.httpBody = data
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode

            if statusCode == 200 {
                print("SUCCESS")
            } else {
                print("FAILURE")
            }
        }

        task.resume()
    }
    
    func editUserAchievement(userAchievement: UserAchievement){
        let url = URL(string: "http://127.0.0.1:1880/putUserAchievement")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let data = try! JSONEncoder().encode(userAchievement)
        
        request.httpBody = data
        request.setValue(
            "application/json",
            forHTTPHeaderField: "Content-Type"
        )
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            let statusCode = (response as! HTTPURLResponse).statusCode

            if statusCode == 200 {
                print("SUCCESS edit")
            } else {
                print("FAILURE")
            }
        }

        task.resume()
    }

    func achievementFromProfile(profile: Profile) -> [Achievement]{
        
        var achievements: [Achievement] = []
        userAchievements.forEach() { userAchievement in
            if(userAchievement.profile.firstName == profile.firstName) {
                achievements.append(userAchievement.achievement)
            }
        }
        return achievements
    }
}
