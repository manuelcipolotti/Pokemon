//
//  ImagesView.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 16/11/21.
//

import UIKit

class ImagesView: UIView , ViewsDelegate {
    
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        return stackView
    }()

    let row: UIView = {
        let view = UIView.init()
        view.backgroundColor = .lightGray
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        self.backgroundColor = .white
        self.stackView.backgroundColor = .white
        self.stackView.addArrangedSubview(row)
        self.addSubview(self.stackView)
        self.stackView.anchor(top: self.topAnchor, paddingTop: 8,
                              bottom: self.bottomAnchor, paddingBottom: -8,
                              left: self.leadingAnchor, paddingLeft: 20,
                              right: self.trailingAnchor, paddingRight: -20,
                              width: UIScreen.main.bounds.width, height: 200)

    }
    
    func set(images: [String]) {
        
        images.forEach({ imagePath in
            let uiImage: UIImageView = UIImageView.init()
            uiImage.sd_setImage(with: URL.init(string: imagePath))
            self.stackView.addArrangedSubview(uiImage)
            NSLayoutConstraint.activate([
                uiImage.widthAnchor.constraint(equalToConstant: 90),
                uiImage.heightAnchor.constraint(equalToConstant: 90)
            ])
        })
        
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            self.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            self.heightAnchor.constraint(equalToConstant: 110)
        ])

    }

}
