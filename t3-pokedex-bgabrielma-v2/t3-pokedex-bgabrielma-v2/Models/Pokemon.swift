//
//  Pokemon.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 20/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit
class Pokemon:NSObject {
    
    /**
     
     This is a *type of model* references by an **pokemon**
     
     */
    
    private var _nome:String
    private var _xp:Int
    private var _hp:Int
    private var _description:String
    private var _attacks:[Attack]
    private var _type:EnumType
    private var _subType:EnumType
    private var _strengh:Int
    private var _evolutions:[Pokemon]
    private var _image:UIImage
    private var _id:Int
    
    /* Counter */
    private static var _count:Int = 0
    
    // With evolutions
    public init(_nome: String, _xp:Int, _hp:Int, _description:String,
                _attacks:[Attack], _type:EnumType, _subType:EnumType,
                _strengh:Int, _evolutions:[Pokemon], _image:UIImage) {
        
        self._nome = _nome
        self._xp = _xp
        self._hp = _hp
        self._description = _description
        self._attacks = _attacks
        self._type = _type
        self._subType = _subType
        self._strengh = _strengh
        self._evolutions = _evolutions
        self._image = _image
        
        Pokemon._count += 1
        
        // set ID Pokemon
        self._id = Pokemon._count
    }
    
    //Without evolutions
    public init(_nome: String, _xp:Int, _hp:Int, _description:String,
                _attacks:[Attack], _type:EnumType, _subType:EnumType,
                _strengh:Int, _image:UIImage) {
        
        self._nome = _nome
        self._xp = _xp
        self._hp = _hp
        self._description = _description
        self._attacks = _attacks
        self._type = _type
        self._subType = _subType
        self._strengh = _strengh
        self._image = _image
        
        self._evolutions = []
        Pokemon._count += 1
        
        // set ID Pokemon
        self._id = Pokemon._count
    }
    
    // Other methods
    public func evolve() {}
    
    // Counter all pokemons currently
    public static func count() -> Int {
        return Pokemon._count
    }
    
    // Encapsulate
    
    public var nome:String
    {
        get { return self._nome }
        set { self._nome = newValue }
    }
    public var xp:Int
    {
        get { return self._xp }
        set { self._xp = newValue }
    }
    public var hp:Int
    {
        get { return self._hp }
        set { self._hp = newValue }
    }
    public var Description:String
    {
        get { return self._description }
        set { self._description = newValue }
    }
    public var attacks:[Attack]
    {
        get { return self._attacks }
        set { self._attacks = newValue }
    }
    public var type:EnumType
    {
        get { return self._type }
        set { self._type = newValue }
    }
    public var subType:EnumType
    {
        get { return self._subType }
        set { self._subType = newValue }
    }
    public var strengh:Int
    {
        get { return self._strengh }
        set { self._strengh = newValue }
    }
    public var evolutions:[Pokemon]
    {
        get { return self._evolutions }
        set { self._evolutions = newValue }
    }
    public var image:UIImage
    {
        get { return self._image }
        set { self._image = newValue }
    }
    public var id:Int {
        get { return self._id }
    }
}
