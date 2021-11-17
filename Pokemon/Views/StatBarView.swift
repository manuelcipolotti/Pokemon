//
//  StatBarView.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 17/11/21.
//

import UIKit

class StatBarView: UIView, ViewsDelegate {
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        return stackView
    }()
    
    let labelBaseValue = ValueLabel.init()
    let view: UIView = UIView.init()
    let viewBar: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
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
        
        self.stackView.backgroundColor = .white
        self.stackView.addArrangedSubview(viewBar)
        self.stackView.addArrangedSubview(view)
        self.stackView.addArrangedSubview(labelBaseValue)
        self.addSubview(self.stackView)
        self.stackView.anchor(top: self.topAnchor, paddingTop: 8,
                              bottom: self.bottomAnchor, paddingBottom: -8,
                              left: self.leadingAnchor, paddingLeft: 20,
                              right: self.trailingAnchor, paddingRight: -20,
                              width: UIScreen.main.bounds.width, height: 200)
        NSLayoutConstraint.activate([
            labelBaseValue.widthAnchor.constraint(equalToConstant: 70)
        ])

    }

    func set(stat: PokemonItemDetailStats) {
        self.labelBaseValue.text = "\(stat.base)"
        if let color = UIColor.init(named: stat.name) {
            self.labelBaseValue.textColor = color
            self.viewBar.backgroundColor = color
        }
        let width: CGFloat = (UIScreen.main.bounds.width - 70 - 40) * CGFloat.init(stat.base)/CGFloat.init(250)
        
        NSLayoutConstraint.activate([
            viewBar.widthAnchor.constraint(equalToConstant: width)
        ])
    }

    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.heightAnchor.constraint(equalToConstant: 70)
        ])

    }
    
}
