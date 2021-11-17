//
//  PokemonListViewCell.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 12/11/21.
//

import UIKit
import SDWebImage

class PokemonListViewCell: UITableViewCell {

    let label = ValueLabel.init()
    let labelId = ValueLabel.init()
    let imageViewPoke = UIImageView.init()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

//        imageViewPoke.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))

        self.addSubview(label)
        self.addSubview(labelId)
        self.addSubview(imageViewPoke)
        labelId.textColor = .lightGray
//        labelId.backgroundColor = .green
//        label.backgroundColor = .yellow

        labelId.anchor(top: self.topAnchor, paddingTop: 8,
                       bottom: label.topAnchor, paddingBottom: -8,
                       left: self.leadingAnchor, paddingLeft: 20,
                       right: imageViewPoke.leadingAnchor, paddingRight: -12,
                       width: 0, height: self.bounds.height/2 - 32)
        label.anchor(top: labelId.bottomAnchor, paddingTop: 8,
                      bottom: self.bottomAnchor, paddingBottom: -8,
                      left: self.leadingAnchor, paddingLeft: 20,
                      right: imageViewPoke.leadingAnchor, paddingRight: -12,
                      width: 0, height: self.bounds.height/2 - 32)
        imageViewPoke.anchor(top: self.topAnchor, paddingTop: 8,
                      bottom: self.bottomAnchor, paddingBottom: -8,
                      left: nil, paddingLeft: 12,
                      right: self.trailingAnchor, paddingRight: -12,
                      width: 90, height: 90)
        imageViewPoke.layer.borderColor = UIColor.lightGray.cgColor
        imageViewPoke.layer.borderWidth = 2
        imageViewPoke.layer.cornerRadius = 8
        imageViewPoke.heightAnchor.constraint(equalToConstant: 90).isActive = true
        imageViewPoke.widthAnchor.constraint(equalToConstant: 90).isActive = true

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupView(pokemon: PokemonItemList) {
        self.labelId.text = "#\(pokemon.id)"
        self.label.text = pokemon.name
        self.imageViewPoke.sd_setImage(with: URL.init(string: pokemon.imagePath))
    }
    
    

}
