//
//  PokemonDetailViewController.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 13/11/21.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    private let viewModel: PokemonDetailViewModel
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = .white
        return stackView
    }()
    
    init(viewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        configureSubviews()
        setupConstraints()
        self.setupBinding()
    }
    
    
    private func configureSubviews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(stackView)
    }
    
    
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
        ])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
            stackView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
        ])
        stackView.backgroundColor = .white

    }
    
    func setupBinding() {
        viewModel.error.bind(listener: {[weak self] error in
            if let error = error {
                print(error)
                self?.showError(error: error)
            }
        })
        viewModel.refresh.bind(listener: {[weak self] isRefresh in
            if let isRefresh = isRefresh, isRefresh {
                DispatchQueue.main.async {
                    self?.title = self?.viewModel.getName()
                    self?.stackView.subviews.forEach({$0.removeFromSuperview()})

                    if let images = self?.viewModel.getImages() {
                        let imagesVies = ImagesView.init()
                        imagesVies.set(images: images)
                        self?.stackView.addArrangedSubview(imagesVies)
                    }

                    let statTitleView = TitleView.init(title: LanguageManager.localize("stats"))
                    self?.stackView.addArrangedSubview(statTitleView)
                    self?.viewModel.getStats()?.forEach({ stat in
                        let view = StatsView.init()
                        view.set(stat: stat)
                        self?.stackView.addArrangedSubview(view)
                    })
                    
                    let typeTitleView = TitleView.init(title: LanguageManager.localize("types"))
                    self?.stackView.addArrangedSubview(typeTitleView)
                    self?.viewModel.getTypes()?.forEach({ type in
                        let view = TypesView.init()
                        view.set(type: type)
                        self?.stackView.addArrangedSubview(view)
                    })



                    if let stackView = self?.stackView {
                        for view in stackView.arrangedSubviews {
                            if let viewConstraints = view as? ViewsDelegate {
                                viewConstraints.setConstraints()
                            }
                        }
                    }
                    
                }
                
                
            }
        })
        viewModel.fetchPokemonDetail()

    }
    
    func showError(error: String) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(
                                title: "Oops!",
                                message: error,
                                preferredStyle: .alert
                            )
            alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
}
