//
//  PokemonCellTableViewCell.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 23/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

class PokemonCellTableViewCell: UICollectionViewCell {

    // Cell properties
    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    var mode:PokemonCellType = .Read
    
    // Pokemon object reference
    var pokemonId:Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
        self.backgroundColor = .white
        self.clipsToBounds = true
        self.imgCell.contentMode = .scaleToFill
        self.lblName.font = UIFont.systemFont(ofSize: 12.0)
        self.lblName.textColor = .white
    }

}
