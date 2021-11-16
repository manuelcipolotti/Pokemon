//
//  ValueLabel.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 15/11/21.
//

import UIKit

class ValueLabel: UILabel {

    init() {
        super.init(frame: CGRect.init())
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.font = UIFont.boldSystemFont(ofSize: 16)
        } else {
            self.font = UIFont.boldSystemFont(ofSize: 18)
        }
        self.backgroundColor = .white

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
