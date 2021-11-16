//
//  PokemonListViewCell.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 12/11/21.
//

import UIKit
import SDWebImage

class PokemonListViewCell: UITableViewCell {

    let label = UILabel.init()
    let imageViewPoke = UIImageView.init()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

//        imageViewPoke.sd_setImage(with: URL(string: "http://www.domain.com/path/to/image.jpg"), placeholderImage: UIImage(named: "placeholder.png"))

        self.addSubview(label)
        self.addSubview(imageViewPoke)
        label.anchor(top: self.topAnchor, paddingTop: 8,
                      bottom: self.bottomAnchor, paddingBottom: -8,
                      left: self.leadingAnchor, paddingLeft: 20,
                      right: imageViewPoke.trailingAnchor, paddingRight: 12,
                      width: 0, height: 0)
        imageViewPoke.anchor(top: self.topAnchor, paddingTop: 8,
                      bottom: self.bottomAnchor, paddingBottom: -8,
                      left: label.trailingAnchor, paddingLeft: 12,
                      right: self.trailingAnchor, paddingRight: -12,
                      width: 90, height: 90)
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
        self.label.text = pokemon.name
        self.imageViewPoke.sd_setImage(with: URL.init(string: pokemon.imagePath))
    }
    
    

}
