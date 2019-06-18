//
//  Pokemon.swift
//  t3-pokedex-project-bgabrielma
//
//  Created by Aluno_Istec on 18/06/2019.
//  Copyright © 2019 ISTEC. All rights reserved.
//

import UIKit

class Pokemon {
    
    /**
    
     This is a *type of model* references by an **pokemon**
     
    */
    
    private var _nome:String;
    private var _xp:Int;
    private var _hp:Int;
    private var _description:String;
    
    // Lista de ataques ?
    
    private var _type:String;
    private var _subType:String;
    private var _strengh:Int;
    private var _evolutions:[Pokemon];
    private var _pathImage:String;
    
    // Com evoluções
    
    init(_nome: String, _xp:Int, _hp:Int, _description:String,
         /* lista de ataques */ _type:String, _subType:String,
                                _strengh:Int, _evolutions:[Pokemon], _pathImage:String) {
        
        self._nome = _nome;
        self._xp = _xp;
        self._hp = _hp;
        
    }
}
