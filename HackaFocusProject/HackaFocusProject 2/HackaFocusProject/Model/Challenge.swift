//
//  Challenge.swift
//  HackaFocus
//
//  Created by Turma02-5 on 28/06/24.
//

import Foundation

struct Challenge: Hashable, Decodable, Encodable {
    var _id: String?
    var _rev: String?
    var posts: [Post]?
    var name: String
    var description: String?
    var start_date: String?
    var end_date: String?
    var picture_URL: String?
    var scoring_mode: Int?
}
