//
//  Model.swift
//  Aula08
//
//  Created by Turma02-8 on 14/06/24.
//

import Foundation

struct Marca: Decodable, Hashable{
    var codigo: String?
    var nome: String?
}

struct Modelo: Decodable, Hashable{
    var codigo: Int?
    var nome: String?
}

struct Ano: Decodable, Hashable{
    var codigo: String?
    var nome: String?
}

struct Price: Codable{
    var TipoVeiculo: Int? = nil
    var Valor: String? = nil
    var Marca: String? = nil
    var Modelo: String? = nil
    var AnoModelo: Int? = nil
    var Combustivel: String? = nil
    var CodigoFipe: String? = nil
    var MesReferencia: String? = nil
    var SiglaCombustivel: String? = nil
}

struct APIModelo: Decodable{
    var modelos: [Modelo]
}
