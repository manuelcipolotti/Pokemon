//
//  TitleLabel.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 15/11/21.
//

import UIKit

class TitleLabel: UILabel {

    init(title: String) {
        super.init(frame: CGRect.init())
        self.text = title
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.font = UIFont.systemFont(ofSize: 18)
        } else {
            self.font = UIFont.systemFont(ofSize: 22)
        }
        self.backgroundColor = .white

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
