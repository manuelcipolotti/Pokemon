//
//  PokemonAPI.swift
//  Pokémon
//
//  Created by Cipolotti, Manuel on 10/11/21.
//

import Foundation

class PokemonAPI: NSObject {
    
    static let shared = PokemonAPI()
    
    let defaultSession = URLSession(configuration: .default)
    
    typealias QueryResult = (PokemonList?, String?) -> Void
    typealias APIResult = (Any?, String?) -> Void

    func getPokemonList(limit: Int? = nil, offset: Int? = nil, completion: @escaping QueryResult) {
      
        if var urlComponents = Configuration.shared.getPokemonListAPI() {
            if let limit = limit,
               let offset = offset {
                urlComponents.query = "limit=\(limit)&offset=\(offset)";
            }
        
            guard let url = urlComponents.url else {
              return
            }
          
            let dataTask = defaultSession.dataTask(with: url) {  data, response, error in
              
              if let error = error {
                  completion(nil, "getPokemonList: " + error.localizedDescription)
              } else if let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                  do {
                      let decodedResponse = try JSONDecoder().decode(PokemonList.self, from: data)
                      completion(decodedResponse, nil)
                  } catch {
                      print(error.localizedDescription)
                      completion(nil, error.localizedDescription)
                  }
              }
            }
            
            dataTask.resume()
        } else {
            completion(nil, "Errore in configurazione")
        }
    }
    
    
    func getAPIResource<T: Decodable>(for: T.Type = T.self,
                                      apiResource: APIResource, completion: @escaping APIResult) {
        
        if let apiUrl = apiResource.url,
           let url = URL.init(string: apiUrl) {
            let dataTask = defaultSession.dataTask(with: url) { data, response, error in
              
              if let error = error {
                  completion(nil, "getPokemon: " + error.localizedDescription)
              } else if let data = data,
                        let response = response as? HTTPURLResponse,
                        response.statusCode == 200 {
                  do {
                      let decodedResponse = try JSONDecoder().decode(T.self, from: data)
                      completion(decodedResponse, nil)

                  } catch {
                      completion(nil, error.localizedDescription)
                  }
              }
            }
            
            dataTask.resume()
        } else {
           completion(nil, "URL non trovata")
        }
        
    }
    
}
