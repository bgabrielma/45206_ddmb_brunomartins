//
//  PokemonCellTableViewCell.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 23/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

class PokemonCellTableViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor.gray
        self.clipsToBounds = true
        self.imgCell.contentMode = .scaleAspectFit
        
        self.lblName.font = UIFont.systemFont(ofSize: 12.0)
        self.lblName.text = "Eeve"
        self.lblName.backgroundColor = .yellow
        self.lblName.tintColor = .white
    }

}
