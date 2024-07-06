//
//  ChallengeManager.swift
//  HackaFocus
//
//  Created by Turma02-6 on 24/06/24.
//

import Foundation
import Combine

class ChallengeManager: ObservableObject {
    @Published var challenges: [Challenge] = []

    func fetchChallenges() {
        guard let url = URL(string: "http://127.0.0.1:1880/challenges") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print("No data returned: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let challengesResponse = try JSONDecoder().decode([Challenge].self, from: data)

                DispatchQueue.main.async {
                    self?.challenges = challengesResponse
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
    
    func createChallenge(challenge: Challenge){
        let url = URL(string: "http://127.0.0.1:1880/postChallenge")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(challenge)
        
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
    
    func editChallenge(challenge: Challenge){
        let url = URL(string: "http://127.0.0.1:1880/putChallenge")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let data = try! JSONEncoder().encode(challenge)
        
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
}
