//
//  Notification.swift
//  HackaFocus
//
//  Created by Turma02-5 on 28/06/24.
//

import Foundation

struct Notification:Hashable,Decodable,Encodable{
    var _id: String?
    var _rev: String?
    var message: String
    var isInvite: Bool?
    var isAccepted: Bool?
}

