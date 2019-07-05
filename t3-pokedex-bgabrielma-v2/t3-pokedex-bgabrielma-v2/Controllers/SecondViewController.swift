//
//  SecondViewController.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 20/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UISearchControllerDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // Aux props
    public var willDeleteForId:Int = 0
    
    // Filter props
    public var cells:[Pokemon] = []
    public var filterCells:[Pokemon] = [] {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    public var filterText:String? {
        didSet {
            guard let text = self.filterText, text == "" else {
                self.filterCells = self.cells.filter {elem in elem.nome.lowercased().contains(self.filterText!.lowercased())}
                return
            }
            // filterText != ""
            self.filterCells = self.cells
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // Do any additional setup after loading the view.
        print("View did appear")
        
        self.initData()
    }
    
    func initData() {
        // Get all pokemons
        self.cells = AppUtils.pokemons
        
        // set filter cells example
        self.filterCells = self.cells
        
        configTabBar()
        configNavigation()
        setupSearchBar();
        
        // For pokemons which have been updated
        self.collectionView.reloadData()
    }
    
    func configTabBar() {
        AppUtils.configureTabBar(view: self, badgeColor: UIColor.white, barTintColor: AppUtils.primaryColor, tintColor: UIColor.white, unSelectedItemColor: UIColor(red: 1, green: 1, blue: 1, alpha: 0.6))
    }
    
    func configNavigation() {
        AppUtils.configureNavigation(view: self, navTitle: "Pokemon list - pokedex", barTint: AppUtils.primaryColor, color: UIColor.white, barStyle: UIBarStyle.black)
        
    }
    
    func setupSearchBar() {
        // Setup Search bar controller
        let searchController = UISearchController(searchResultsController: nil)
        
        searchController.searchBar.delegate = self
        searchController.definesPresentationContext = true
        searchController.searchBar.sizeToFit();
        searchController.searchBar.tintColor = .white
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    @objc
    func deletePokemon(button: UIButton) {
        let deleteAlert = AppUtils.createAlert(title: "Apagar pokemon", message: "Deseja realmente apagar este pokemon?")
        
        deleteAlert.addAction(UIAlertAction(title: "Sim", style: .default, handler: { (action) in
            
            // delete, in all pokemons, possible evolutions whose pokemon is this
            AppUtils.deleteEvolutionsLinkedBy(pokemonId: button.tag)
            
            let index = AppUtils.pokemons.firstIndex(of: AppUtils.findPokemonById(id: button.tag)!)
            AppUtils.pokemons.remove(at: index!)
        }))
        deleteAlert.addAction(UIAlertAction(title: "Não", style: .default, handler: nil))
        
        self.present(deleteAlert, animated: true, completion: nil)
        
        self.initData()
    }
}

extension SecondViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.collectionView.reloadData()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterText = searchText
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokemonCellTableViewCell else {
            return UICollectionViewCell()
        }
        cell.lblName.font = UIFont.systemFont(ofSize: 12.0)
        cell.lblName.text = filterCells[indexPath.row].nome
        cell.lblName.backgroundColor = AppUtils.primaryColor
        cell.imgCell.image = filterCells[indexPath.row].image
        
        // set pokemon reference by give an id
        cell.pokemonId = filterCells[indexPath.row].id
        
        // Add action to delete button and link id cell into willDeleteForId
        // we'll use tag button to save/store the id
        cell.btnRemove.tag = cell.pokemonId!
        cell.btnRemove.addTarget(self, action: #selector(self.deletePokemon(button:)), for: .touchUpInside)
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filterCells.count
    }
    
}

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let cell = collectionView.cellForItem(at: indexPath) as? PokemonCellTableViewCell
        
        guard let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as? FirstViewController else {
            return
        }
        // Link references
        detailsVC.mode = .Edit
        detailsVC.idPokemonReceivedFromCell = cell!.pokemonId!
        
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
