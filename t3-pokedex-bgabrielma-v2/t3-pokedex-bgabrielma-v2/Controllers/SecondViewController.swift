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
    public let filterPokemons = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        configTabBar()
        configNavigation()
        setupSearchBar();
        
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
}

extension SecondViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.collectionView.reloadData()
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokemonCellTableViewCell else {
            return UICollectionViewCell()
        }
        cell.lblName.font = UIFont.systemFont(ofSize: 12.0)
        cell.lblName.text = "Ivassaur"
        cell.lblName.backgroundColor = AppUtils.primaryColor
        cell.imgCell.image = UIImage(named: "preview")
        
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // mais um -> para acrescentar a célula de adicionar pokemon
        return AppUtils.pokemons.count + 16
    }
    
}

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // let cell = collectionView.cellForItem(at: indexPath) as? PokemonCellTableViewCell
        
        guard let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsPokemonViewController") as? DetailsPokemonViewController else {
            return
        }
        
        let viewToPush:UIViewController = detailsVC 
        
        detailsVC.data = "Cell row index: \(indexPath.row)"
        self.navigationController?.pushViewController(viewToPush, animated: true)
    }
}
