//
//  ContentView.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import SwiftUI

struct CreatePost: View {
    @State var challengeId: String
    @State private var post = Post(id_challenge: "Testando", description: "Post de Teste")
    @StateObject var postManager = PostManager()
    
    var body: some View {
        VStack {
            Form {
                TextField("description", text: $post.description)
                .autocapitalization(.none)
                
                
                
                Button(action: {
                    post.id_challenge = challengeId
                    postManager.createPost(p: post)
                }) {
                    Text("Create User")
                }
            }
            List(postManager.posts, id: \.self._id) { post in
                Text(post.description)
            }
        }
        .padding()
    }
}

#Preview {
    CreatePost(challengeId: "Teste")
}
