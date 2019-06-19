//
//  Pokemon.swift
//  t3-pokedex-project-bgabrielma
//
//  Created by Aluno_Istec on 18/06/2019.
//  Copyright © 2019 ISTEC. All rights reserved.
//

import Foundation

class Pokemon {
    
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
    private var _pathImage:String
    
    // With evolutions
    public init(_nome: String, _xp:Int, _hp:Int, _description:String,
                _attacks:[Attack], _type:EnumType, _subType:EnumType,
                _strengh:Int, _evolutions:[Pokemon], _pathImage:String) {
        
        self._nome = _nome
        self._xp = _xp
        self._hp = _hp
        self._description = _description
        self._attacks = _attacks
        self._type = _type
        self._subType = _subType
        self._strengh = _strengh
        self._evolutions = _evolutions
        self._pathImage = _pathImage
        
        Pokemon.count += 1
    }
    
    //Without evolutions
    public init(_nome: String, _xp:Int, _hp:Int, _description:String,
                _attacks:[Attack], _type:EnumType, _subType:EnumType,
                _strengh:Int, _pathImage:String) {
        
        self._nome = _nome
        self._xp = _xp
        self._hp = _hp
        self._description = _description
        self._attacks = _attacks
        self._type = _type
        self._subType = _subType
        self._strengh = _strengh
        self._pathImage = _pathImage
        
        self._evolutions = []
        Pokemon.count += 1
    }
    
    // Other methods
    public func evolve() {}
    
    // Encapsulate
    
    /* Counter */
    public static var count:Int = 0
    
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
    public var description:String
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
    public var pathImage:String
    {
        get { return self._pathImage }
        set { self._pathImage = newValue }
    }
}
