//
//  MembershipManager.swift
//  HackaFocus
//
//  Created by Turma02-18 on 26/06/24.
//

import Foundation
import Combine

class MembershipManager:ObservableObject{
    @Published var memberships: [Membership] = []
    
    func fetchMemership() {
        guard let url = URL(string: "http://127.0.0.1:1880/memberships") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print("No data returned: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let membershipsResponse = try JSONDecoder().decode([Membership].self, from: data)

                DispatchQueue.main.async {
                    self?.memberships = membershipsResponse
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
    
    func createMembership(membership: Membership){
        let url = URL(string: "http://127.0.0.1:1880/postMembership")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(membership)
        
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
    
    func editMembership(membership: Membership){
        let url = URL(string: "http://127.0.0.1:1880/putMembership")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let data = try! JSONEncoder().encode(membership)
        
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

    func challengesFromProfile(profile: Profile) -> [Challenge] {
        
        var challenges: [Challenge] = []
        memberships.forEach() { membership in
            if(membership.profile.firstName == profile.firstName) {
                challenges.append(membership.challenge)
            }
        }
        return challenges
    }
}
    
    
    

