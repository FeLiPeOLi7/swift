//
//  Model.swift
//  Aula08_2
//
//  Created by Turma02-8 on 18/06/24.
//

import Foundation


struct Vaga: Decodable, Hashable{
    var slug: String?
    var company_name: String?
    var title: String?
    var description: String?
    var remote: Bool?
    var url: String?
    var tags: [String]?
    var job_types: [String]?
    var location: String?
    var created_at: Int?
}

struct API: Decodable{
    var data: [Vaga]
}
