//
//  ValueLabel.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 15/11/21.
//

import UIKit

class ValueLabel: UILabel, ViewsDelegate {

    init() {
        super.init(frame: CGRect.init())
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.font = UIFont.boldSystemFont(ofSize: 28)
        } else {
            self.font = UIFont.boldSystemFont(ofSize: 36)
        }
        self.backgroundColor = .white

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewsDelegate
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])

    }
    
}
