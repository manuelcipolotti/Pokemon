//
//  PokemonViewModel.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 11/11/21.
//

import UIKit

class PokemonViewModel: NSObject {

    var pokemonList: [PokemonItemList] = []
    let error: BoxBinding<String?> = BoxBinding(nil)
    let refresh: BoxBinding<Bool?> = BoxBinding(false)
    var limit: Int?
    var offset: Int?
    
    func fetchPokemonList() {
        PokemonAPI.shared.getPokemonList(limit: limit,
                                    offset: offset,
                                    completion: { result, error in
            self.refresh.value = false
            if let error = error {
                self.error.value = error
            } else {
                if let pokeList = result {
                    self.limit = Utilities.getQueryIntParameter(url: result?.next, param: "limit")
                    self.offset = Utilities.getQueryIntParameter(url: result?.next, param: "offset")
                    let group = DispatchGroup()
                    var pokemonList: [PokemonItemList] = []
                    var errorList: String = ""
                    for pokemon in pokeList.results {
                        group.enter()
                        PokemonAPI.shared.getAPIResource(for:PokemonDetail.self,
                                                            apiResource: pokemon,
                                                            completion: { pokeResource, error in
                            group.leave()
                            if let error = error {
                                errorList.append("\n\(error)")
                            } else {
                                if let pokeResource = pokeResource as? PokemonDetail,
                                  let imagePath = pokeResource.sprites?.front_default {
                                    pokemonList.append(PokemonItemList.init(name: pokeResource.name,
                                                                            id: pokeResource.id,
                                                                            apiRef: pokemon,
                                                                            imagePath: imagePath))
                                }
                            }
                        })
                        
                    }
                    group.notify(queue: .main, execute: {
                        
                        if !errorList.isEmpty {
                            self.error.value = errorList
                        }

                        self.pokemonList.append(contentsOf: pokemonList)
                        self.pokemonList.sort(by: {$0.id < $1.id})
                        self.refresh.value = true
                    })
                    
                }
            }
        })
    }
    
    func getPokemonByIndexRow(row: Int) -> PokemonItemList? {
        if row >= 0 && pokemonList.count > row {
            return pokemonList[row]
        }
        return nil
    }
    
    func getPokemoListSize() -> Int {
        return pokemonList.count;
    }
    
    func getDetailViewModel(item: PokemonItemList) -> PokemonDetailViewModel {
        return PokemonDetailViewModel.init(pokemon: item.apiRef)
    }
    
    
}
