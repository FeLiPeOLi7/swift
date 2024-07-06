//
//  PostManager.swift
//  HackaFocusProject
//
//  Created by Turma01-27 on 01/07/24.
//

import Foundation
import UIKit

class PostManager: ObservableObject{
    @Published var posts: [Post] = []
    
    func fetchPosts(){
        guard let url = URL(string: "http://127.0.0.1:1880/posts") else{
            return
        }
        
        let task = URLSession.shared.dataTask(with: url){ [weak self] data, _, error in
            guard let data = data, error == nil else{
                return
            }
            
            do{
                let jsonDecodificado = try JSONDecoder().decode([Post].self, from:data)
                DispatchQueue.main.async{
                    self?.posts = jsonDecodificado
                }
            }catch{
                print(error)
            }
        }
        
        task.resume()
    }
    
    //Basicamente essa funcao eh como se a gente fizesse um post pelo postman, so que a gnt esta fazendo por codigo pelo swift
    func createPost(p: Post){
        let url = URL(string: "http://127.0.0.1:1880/postPost")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let data = try! JSONEncoder().encode(p)
        
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
    
    func editPost(editedPost: Post){
        let url = URL(string: "http://127.0.0.1:1880/putPost")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "PUT"
        
        let data = try! JSONEncoder().encode(editedPost)
        
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
    func fetchFiltrado(challengeId: String) -> [Post]{
        return posts.filter ({$0.id_challenge! == challengeId})
   }
}
