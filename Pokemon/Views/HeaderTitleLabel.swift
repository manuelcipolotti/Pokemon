//
//  HeaderTitleLabel.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 16/11/21.
//

import UIKit

class HeaderTitleLabel: UILabel {


    init(title: String) {
        super.init(frame: CGRect.init())
        self.text = title
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.font = UIFont.boldSystemFont(ofSize: 18)
        } else {
            self.font = UIFont.boldSystemFont(ofSize: 22)
        }
        self.backgroundColor = .white

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

}
