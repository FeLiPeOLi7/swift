//
//  testeAPI.swift
//  HackaFocus
//
//  Created by Turma02-11 on 25/06/24.
//

import Foundation

struct Profile: Hashable, Decodable, Encodable {
    var _id: String?
    var _rev: String?
    var notifications: [Notification]?
    var firstName: String
    var lastName: String?
    var bio: String?
    var profilePictureURL: String?
    var currentStreak: Int?
    var maximumStreak: Int?
    var totalDone: Int?
    var joinedDate: String?
}



