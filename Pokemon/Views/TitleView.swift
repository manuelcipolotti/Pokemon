//
//  TitleView.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 15/11/21.
//

import UIKit

class TitleView: UIView, ViewsDelegate {
    

    let labelTitle: HeaderTitleLabel

    init(title: String) {
        self.labelTitle = HeaderTitleLabel.init(title: title)
        super.init(frame: CGRect.init())
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.backgroundColor = .white
        self.addSubview(labelTitle)
        labelTitle.anchor(top: self.topAnchor, paddingTop: 8,
                      bottom: self.bottomAnchor, paddingBottom: -8,
                      left: self.leadingAnchor, paddingLeft: 20,
                      right: self.trailingAnchor, paddingRight: -20,
                      width: 0, height: 60)

    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])

    }

}
