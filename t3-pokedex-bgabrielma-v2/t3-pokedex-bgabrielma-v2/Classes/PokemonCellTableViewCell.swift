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
        self.lblName.text = "Bulbassaur"
    }

}
