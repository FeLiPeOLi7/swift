//
//  User.swift
//  HackaFocus
//
//  Created by Turma02-5 on 24/06/24.
//

import Foundation

struct User: Hashable, Decodable, Encodable {
    var _id: String?
    var _rev: String?
    var username: String
    var profile: Profile?
    var password: String
}
