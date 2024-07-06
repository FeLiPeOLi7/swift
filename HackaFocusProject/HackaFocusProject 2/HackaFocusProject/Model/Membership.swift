//
//  Membership.swift
//  HackaFocus
//
//  Created by Turma02-18 on 25/06/24.
//

import Foundation

struct Membership:Hashable,Decodable,Encodable{
    var _id: String?
    var _rev: String?
    var profile:Profile
    var challenge:Challenge
    var role:String?
    var currentStreak:Int?
    var isActive:Bool?
}
