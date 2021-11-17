//
//  PokemonListViewController.swift
//  Pokemon
//
//  Created by Cipolotti, Manuel on 11/11/21.
//

import UIKit

class PokemonListViewController: UIViewController {

    
    static let myIdentifier = "pokemonCell"
    
    let viewModel: PokemonViewModel = PokemonViewModel()
    let tableView: UITableView = UITableView.init()
    var selectedRow: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupBinding()
        self.setupUI()
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
                self?.tableView.reloadData()
            }
        })

        viewModel.fetchPokemonList()

    }
    
    func setupUI() {
        
        self.view.backgroundColor = .white
        self.title = "Pokémon"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.prefetchDataSource = self
        self.view.addSubview(tableView)
        tableView.anchor(top: self.view.safeAreaLayoutGuide.topAnchor, paddingTop: 0,
                         bottom: self.view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 0,
                         left: view.leadingAnchor, paddingLeft: 0,
                         right: view.trailingAnchor, paddingRight: 0,
                         width: 0, height: 0)
        
        self.tableView.register(PokemonListViewCell.self, forCellReuseIdentifier: PokemonListViewController.myIdentifier)
        
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

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let selectedRow = self.selectedRow {
            self.tableView.deselectRow(at: selectedRow, animated: false)
        }
    }
    
}


extension PokemonListViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    
    //MARK: UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getPokemoListSize()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: PokemonListViewController.myIdentifier,
                                                    for: indexPath) as? PokemonListViewCell,
           let pokemonItemList = self.viewModel.getPokemonByIndexRow(row: indexPath.row) {
            cell.setupView(pokemon: pokemonItemList)
            return cell
        } else {
            return UITableViewCell.init()
        }
    }
    
    
    //MARK: UITableViewDataSourcePrefetching
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        var maxRow: Int = 0
        indexPaths.forEach({ indexPath in
            if indexPath.row > maxRow {
                maxRow = indexPath.row
            }
        })
        print("max row = \(maxRow)")
        if (maxRow >= self.viewModel.getPokemoListSize() - 1) {
            print("load")
            viewModel.fetchPokemonList()
        }
        
    }
    
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let pokemonItemList = self.viewModel.getPokemonByIndexRow(row: indexPath.row) {
            self.selectedRow = indexPath
            let detaiViewModel = self.viewModel.getDetailViewModel(item: pokemonItemList)
            let detailVC = PokemonDetailViewController.init(viewModel: detaiViewModel)
            self.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    
    
}
