//
//  ViewController.swift
//  collections
//
//  Created by Developer on 28/05/2019.
//  Copyright © 2019 bgabrielma. All rights reserved.
//

import UIKit

class pCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    
    override func awakeFromNib() {
        img.contentMode = .scaleToFill
    }
}

class ViewController: UIViewController {

    var cores:[[UIColor]] = [[.purple, .gray, .green, .red],[.purple, .gray, .green, .red]]
    
    var fotos:[[String]] = [["foto1", "foto2", "foto3"], ["foto1", "foto2", "foto3"]]
    
    @IBOutlet weak var img: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.cores.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cores[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! pCell
       
        cell.backgroundColor = self.cores[indexPath.section][indexPath.row]
        cell.img.image = UIImage(named: self.fotos[indexPath.section][indexPath.row])
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        img.image = (collectionView.cellForItem(at: indexPath) as! pCell).img.image
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = collectionView.frame.width
        return CGSize(width: w, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
