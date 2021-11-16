//
//  PokemonItemDetail.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 11/11/21.
//

import Foundation


struct PokemonItemDetailStats {
    var name: String
    var base: Int
    var effort: Int
}

struct PokemonItemDetailTypes {
    var name: String
    var slot: Int
}

struct PokemonItemDetail {
    var name: String
    var imagePath: [String]
    var stats: [PokemonItemDetailStats]
    var types: [PokemonItemDetailTypes]

}
