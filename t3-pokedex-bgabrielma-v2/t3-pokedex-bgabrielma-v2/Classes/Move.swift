//
//  Attack.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Bruno Martins on 20/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import Foundation

class Attack {
    private var _designation:String
    private var _type:EnumType
    
    // Constructor
    public init(designation: String, type: EnumType) {
        self._designation = designation
        self._type = type
    }
    
    /**
     Encapsulate
     **/
    
    public var designation:String
    {
        get {
            return self._designation
        }
        set {
            self._designation = newValue
        }
    }
    public var type:EnumType {
        get {
            return self._type
        }
        set {
            self._type = type
        }
    }
}
