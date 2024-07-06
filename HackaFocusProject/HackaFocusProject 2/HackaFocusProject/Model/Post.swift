//
//  PostModel.swift
//  Trabalho Final Posts
//
//  Created by Turma02-8 on 25/06/24.
//

import Foundation

struct Post: Hashable,Decodable,Encodable{
    var _id: String?
    var _rev: String?
    var profile: Profile?
    var id_challenge: String?
    var img: String?
    var likes: Int?
    var comments: [PostComment]?
    var date: String?
    var description: String
    var isLiked: Bool?
}

struct PostComment: Hashable,Decodable,Encodable{
    var _id: String?
    var profileId: String?
    var date: String?
    var description: String?
    var isLiked: Bool?
    var comments: [PostComment]?
}
