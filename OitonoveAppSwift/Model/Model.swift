//
//  Model.swift
//  ConsumindoAPI
//
//  Created by Turma01-17 on 23/07/24.
//

import Foundation

struct Vendas : Codable, Hashable {
    var _id : String?
    var _rev : String?
    var cliente : String?
    var produto : [Produto]
    var quantidade : Int?
    var data : String?
}

struct Produto : Codable, Hashable{
    var id : Int?
    var descricao : String?
    var cor : String?
    var tamanho : String?
    var valorUnit : Double?
}
