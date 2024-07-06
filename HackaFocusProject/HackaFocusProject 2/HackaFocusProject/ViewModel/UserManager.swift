//
//  VMUser.swift
//  HackaFocus
//
//  Created by Turma02-5 on 24/06/24.
//

import Foundation
import Combine

class UserManager: ObservableObject {
    @Published var users: [User] = []

    func fetchUsers() {
        guard let url = URL(string: "http://127.0.0.1:1880/users") else {
            print("Invalid URL")
            return
        }

        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data else {
                print("No data returned: \(error?.localizedDescription ?? "Unknown error")")
                return
            }

            do {
                let usersResponse = try JSONDecoder().decode([User].self, from: data)

                DispatchQueue.main.async {
                    self?.users = usersResponse
                }
            } catch {
                print("Error decoding JSON: \(error.localizedDescription)")
            }
        }

        task.resume()
    }
    
    func createUser(u: User){
        let url = URL(string: "http://127.0.0.1:1880/postUser")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(u)
        
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
    
    func editUser(user: User){
        let url = URL(string: "http://127.0.0.1:1880/putUser")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let data = try! JSONEncoder().encode(user)
        
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

    
    
    
    
    func autenticateUser(username: String, password: String) -> User?{
        return users.first (where: {$0.username == username && $0.password == password})
    }

    func getUsers() -> [User] {
        // Fetch data, fill users and return
        return users
    }
}
