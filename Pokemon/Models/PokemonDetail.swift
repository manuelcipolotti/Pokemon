//
//  PokemonDetail.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 11/11/21.
//

import Foundation


struct Sprites: Codable {
    var back_default: String?
    var back_female: String?
    var back_shiny: String?
    var back_shiny_female: String?
    var front_default: String?
    var front_female: String?
    var front_shiny: String?
    var front_shiny_female:  String?
}




struct Stats: Codable {
    var base_stat: Int?
    var effort: Int?
    var stat: APIResource?
}


struct Types: Codable {
    var slot: Int
    var type: APIResource
}

struct PokemonDetail: Codable {
    var name: String
    var species: APIResource?
    var sprites: Sprites?
    var stats: [Stats]?
    var types: [Types]?
    
}
