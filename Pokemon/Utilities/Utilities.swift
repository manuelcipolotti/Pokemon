//
//  Utilitis.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 11/11/21.
//

import UIKit

class Utilities: NSObject {
    
    
    static func getQueryIntParameter(url: String?, param: String) -> Int? {
        guard let url = url else { return nil }
        guard let url = URLComponents(string: url) else { return nil }
        guard let valore = url.queryItems?.first(where: { $0.name == param })?.value else {return nil}
        return Int.init(valore)
    }

}
