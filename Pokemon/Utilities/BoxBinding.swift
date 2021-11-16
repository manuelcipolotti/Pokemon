//
//  BoxBinding.swift
//  Pokémon
//
//  Created by Cipolotti, Manuel on 10/11/21.
//

import Foundation

final class BoxBinding<T> {

    typealias Listener = (T) -> Void
    var listener: Listener?

    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
        
    }

    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
}
