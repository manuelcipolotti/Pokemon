//
//  PokemonDetailViewModel.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 13/11/21.
//

import UIKit

class PokemonDetailViewModel: NSObject {
    
    
    var item: PokemonItemDetail?
    let refresh: BoxBinding<Bool?> = BoxBinding(false)
    let error: BoxBinding<String?> = BoxBinding(nil)

    init(pokemon: APIResource) {
        self.pokemon = pokemon
    }
    
    var pokemon: APIResource
    
    func fetchPokemonDetail() {
        self.refresh.value = false
        PokemonAPI.shared.getAPIResource(for:PokemonDetail.self,
                                            apiResource: pokemon,
                                            completion: { pokeResource, error in
            if let pokeDetail = pokeResource as? PokemonDetail {
                var imagesPath: [String] = []
                if let imagePath = pokeDetail.sprites?.front_default {
                    imagesPath.append(imagePath)
                }
                if let imagePath = pokeDetail.sprites?.front_shiny {
                    imagesPath.append(imagePath)
                }
                if let imagePath = pokeDetail.sprites?.front_female {
                    imagesPath.append(imagePath)
                }
                if let imagePath = pokeDetail.sprites?.front_shiny_female {
                    imagesPath.append(imagePath)
                }

                if let imagePath = pokeDetail.sprites?.back_default {
                    imagesPath.append(imagePath)
                }
                if let imagePath = pokeDetail.sprites?.back_shiny {
                    imagesPath.append(imagePath)
                }
                if let imagePath = pokeDetail.sprites?.back_female {
                    imagesPath.append(imagePath)
                }
                if let imagePath = pokeDetail.sprites?.back_shiny_female {
                    imagesPath.append(imagePath)
                }
                var pokemonItemDetailTypes: [PokemonItemDetailTypes] = []
                var pokemonItemDetailStats: [PokemonItemDetailStats] = []
                if let stats = pokeDetail.stats {
                    pokemonItemDetailStats = stats.map({ (stat) -> PokemonItemDetailStats in
                        return PokemonItemDetailStats.init(name: stat.stat?.name ?? "",
                                                           base: stat.base_stat ?? 0,
                                                           effort: stat.effort ?? 0)
                    })
                }
                if let types = pokeDetail.types {
                    pokemonItemDetailTypes = types.map({ (type) -> PokemonItemDetailTypes in
                        return PokemonItemDetailTypes.init(name: type.type.name ?? "",
                                                           slot: type.slot)
                    })
                }
                let detail = PokemonItemDetail.init(name: pokeDetail.name,
                                                    imagePath: imagesPath,
                                                    stats: pokemonItemDetailStats,
                                                    types: pokemonItemDetailTypes)
                self.item = detail
                self.refresh.value = true
                
            }
        })
    }
    
    func getStats() -> [PokemonItemDetailStats]? {
        return self.item?.stats
    }

    func getTypes() -> [PokemonItemDetailTypes]? {
        return self.item?.types
    }

    func getImages() -> [String]? {
        return self.item?.imagePath
    }

    func getName() -> String? {
        return self.item?.name
    }


}
