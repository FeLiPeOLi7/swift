//
//  UserAchievement.swift
//  HackaFocus
//
//  Created by Turma02-5 on 26/06/24.
//

import Foundation

struct UserAchievement: Hashable, Decodable, Encodable {
    var _id: String?
    var _rev: String?
    var profile: Profile
    var achievement: Achievement
}
