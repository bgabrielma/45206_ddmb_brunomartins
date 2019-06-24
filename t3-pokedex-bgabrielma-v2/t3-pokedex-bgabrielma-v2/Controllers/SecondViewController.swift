//
//  SecondViewController.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 20/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationItem.title = "Pokemon"
        self.navigationController?.navigationBar.barTintColor = .orange
        self.navigationController?.navigationBar.barStyle = .black
        self.navigationController?.navigationBar.isTranslucent = false
        
        self.tabBarItem.badgeColor = .white
        self.tabBarController?.tabBar.barTintColor = .orange
        self.tabBarController?.tabBar.tintColor = .white
    }
}

extension SecondViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? PokemonCellTableViewCell else {
            return UICollectionViewCell()
        }
        return cell
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
}

extension SecondViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let detailsVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailsPokemonViewController") as? DetailsPokemonViewController else {
            return
        }
        
        detailsVC.data = "Cell row index: \(indexPath.row)"
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}
