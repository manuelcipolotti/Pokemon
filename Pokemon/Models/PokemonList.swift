//
//  PokemonList.swift
//  Pokémon
//
//  Created by Cipolotti, Manuel on 10/11/21.
//

import Foundation



struct PokemonList: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [APIResource]
}
