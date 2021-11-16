//
//  Configuration.swift
//  Pokémon
//
//  Created by Cipolotti, Manuel on 10/11/21.
//

import UIKit

struct ApiConfig: Decodable {
    var serverPath: String?
    var version: String?
    var pokemonList: String?
    var limit: Int?
}

class Configuration: NSObject {
    
    static let shared = Configuration();
    
    func getPokemonListAPI() -> URLComponents? {
        if let apiConfigPlist = Bundle.main.url(forResource: "APIConfig", withExtension: "plist") {
            do {
                let data = try Data(contentsOf: apiConfigPlist)
                let apiConfig = try PropertyListDecoder().decode(ApiConfig.self, from: data)
                if let serverPath = apiConfig.serverPath,
                   let version = apiConfig.version,
                   let pokemonList = apiConfig.pokemonList,
                   let limitInt = apiConfig.limit {
                    let limit = String.init(limitInt)
                    if var urlComponents = URLComponents.init(string: "\(serverPath)\(version)\(pokemonList)") {
                        urlComponents.query = "limit=\(limit)"
                        return urlComponents
                    }
                } else {
                    print("Configurazione mancante")
                }
            } catch {
                print("Errore in configurazione")
                print(error)
            }
        }
            
        return nil
    }

}
