//
//  Model.swift
//  Aula10
//
//  Created by Turma02-8 on 19/06/24.
//

import Foundation

struct Personagem: Decodable, Hashable{
    var _id: String?
    var _rev:String?
    var nomePersonagem:String?
    var bando:String?
    var apelido:String?
    var idade:Int?
    var nomeNavio:String?
    var foto:String?
    var hakis:[String]?
}
