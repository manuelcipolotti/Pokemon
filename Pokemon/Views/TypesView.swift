//
//  TypesView.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 16/11/21.
//

import UIKit

class TypesView: UIView , ViewsDelegate {
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        return stackView
    }()

    
    let labelNameValue = ValueLabel.init()
    let imageView: UIImageView = UIImageView.init()

    let row: UIView = {
        let view = UIView.init()
        view.backgroundColor = .lightGray
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.backgroundColor = .white
        self.stackView.backgroundColor = .white
        self.stackView.addArrangedSubview(labelNameValue)
        self.stackView.addArrangedSubview(imageView)
        self.addSubview(self.stackView)
        self.stackView.anchor(top: self.topAnchor, paddingTop: 8,
                              bottom: self.bottomAnchor, paddingBottom: -8,
                              left: self.leadingAnchor, paddingLeft: 20,
                              right: self.trailingAnchor, paddingRight: -20,
                              width: UIScreen.main.bounds.width, height: 200)

    }
    
    func set(type: PokemonItemDetailTypes) {
        self.labelNameValue.text = type.name
        if let image = UIImage.init(named: "\(type.name)_Type_Icon") {
            self.imageView.image = image
        }
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: 110)
        ])
        NSLayoutConstraint.activate([
            row.heightAnchor.constraint(equalToConstant: 2)
        ])

        NSLayoutConstraint.activate([
            labelNameValue.heightAnchor.constraint(equalToConstant: 30)
        ])

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 94),
            imageView.heightAnchor.constraint(equalToConstant: 60)
        ])


    }

}
