//
//  StatsView.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 15/11/21.
//

import UIKit

class StatsView: UIView, ViewsDelegate {

    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        return stackView
    }()

    
    let labelNameValue = ValueLabel.init()
    let labelBaseValue = ValueLabel.init()
    let labelEffortValue = ValueLabel.init()

    let labelName: TitleLabel = TitleLabel.init(title: LanguageManager.localize("stats.name"))
    let labelBase: TitleLabel = TitleLabel.init(title: LanguageManager.localize("stats.base"))
    let labelEffort: TitleLabel = TitleLabel.init(title: LanguageManager.localize("stats.effort"))
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
        
        self.stackView.backgroundColor = .white
        self.stackView.addArrangedSubview(row)
        self.stackView.addArrangedSubview(labelNameValue)
//        self.stackView.addArrangedSubview(labelBaseValue)
        self.addSubview(self.stackView)
        self.stackView.anchor(top: self.topAnchor, paddingTop: 8,
                              bottom: self.bottomAnchor, paddingBottom: -8,
                              left: self.leadingAnchor, paddingLeft: 20,
                              right: self.trailingAnchor, paddingRight: -20,
                              width: UIScreen.main.bounds.width, height: 200)

    }
    
    func set(stat: PokemonItemDetailStats) {
        self.labelNameValue.text = stat.name
        self.labelBaseValue.text = "\(stat.base)"
        self.labelEffortValue.text = "\(stat.effort)"

    }
    
    func setConstraints() {
        self.removeConstraints(self.constraints)
        row.removeConstraints(row.constraints)
        labelName.removeConstraints(row.constraints)
        labelNameValue.removeConstraints(row.constraints)
        labelBase.removeConstraints(row.constraints)
        labelBaseValue.removeConstraints(row.constraints)
        labelEffort.removeConstraints(row.constraints)
        labelEffortValue.removeConstraints(row.constraints)

        
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.heightAnchor.constraint(equalToConstant: 50)
        ])
        NSLayoutConstraint.activate([
            row.heightAnchor.constraint(equalToConstant: 2)
        ])

        NSLayoutConstraint.activate([
            labelName.heightAnchor.constraint(equalToConstant: 20)
        ])
//        NSLayoutConstraint.activate([
//            labelNameValue.heightAnchor.constraint(equalToConstant: 30)
//        ])
//
//        NSLayoutConstraint.activate([
//            labelBase.heightAnchor.constraint(equalToConstant: 20)
//        ])
//        NSLayoutConstraint.activate([
//            labelBaseValue.heightAnchor.constraint(equalToConstant: 30)
//        ])
//
//        NSLayoutConstraint.activate([
//            labelEffort.heightAnchor.constraint(equalToConstant: 20)
//        ])
//        NSLayoutConstraint.activate([
//            labelEffortValue.heightAnchor.constraint(equalToConstant: 30)
//        ])

    }

}
