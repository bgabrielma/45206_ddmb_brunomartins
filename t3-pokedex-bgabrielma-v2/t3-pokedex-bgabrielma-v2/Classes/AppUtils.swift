//
//  AppUtils.swift
//  t3-pokedex-bgabrielma-v2
//
//  Created by Developer on 24/06/2019.
//  Copyright © 2019 Bruno Martins. All rights reserved.
//

import UIKit

final class AppUtils: NSObject {
    // find and return image resource
    // return mechanism of types pokemon
    
    public static var typesRelation = [Attack]()
    public static var pokemons = [Pokemon]() 
    public static var primaryColor = UIColor.orange
    
    
    /**
     Um dicionario com duas propriedades
     - tipo eficaz contra: [array de tipos vulneráveis a tal tipo]
    */
    
    public static var typeAttackSystem:[EnumType: [EnumType]] = [
        .NORMAL: [],
        .FIRE: [.GRASS, .ICE, .BUG, .STEEL],
        .WATER: [.FIRE, .GROUND, .ROCK],
        .ELETRIC: [.WATER, .FLYING],
        .GRASS: [.WATER, .GROUND, .ROCK],
        .ICE: [.GRASS, .GROUND, .FLYING, .DRAGON],
        .FIGHTING: [.NORMAL, .ICE, .ROCK, .DARK, .STEEL],
        .POISON: [.GRASS, .FAIRY],
        .GROUND: [.FIRE, .ELETRIC, .POISON, .ROCK, .STEEL],
        .FLYING: [.GRASS, .FIGHTING, .BUG],
        .PSYCHIC: [.FIGHTING, .POISON],
        .BUG: [.GRASS, .PSYCHIC, .DARK],
        .ROCK: [.FIRE, .ICE, .FLYING, .BUG],
        .GHOST: [.PSYCHIC, .GHOST],
        .DRAGON: [.GHOST],
        .DARK: [.PSYCHIC, .GHOST],
        .STEEL: [.ICE, .ROCK, .FAIRY],
        .FAIRY: [.FIGHTING, .GHOST, .DRAGON]
    ]
    
    static func configureNavigation(view: SecondViewController, navTitle: String?, barTint: UIColor, color: UIColor, barStyle: UIBarStyle) {
        view.navigationItem.title = navTitle ?? "undefined"
        view.navigationController?.navigationBar.barTintColor = barTint
        view.navigationController?.navigationBar.barStyle = barStyle
    }
    static func configureTabBar(view: UIViewController, badgeColor: UIColor, barTintColor: UIColor, tintColor: UIColor, unSelectedItemColor: UIColor) {
        view.tabBarController?.tabBar.isTranslucent = false
        view.tabBarController?.tabBar.barTintColor = barTintColor
        view.tabBarController?.tabBar.tintColor = tintColor
        view.tabBarController?.tabBar.unselectedItemTintColor = unSelectedItemColor
        updateSearchBadgeValue(view: view, value: String(pokemons.count))
    }
    static func updateSearchBadgeValue(view: UIViewController, value: String?) {
        if let tabItems = view.tabBarController?.tabBar.items {
            let tab = tabItems[1]
            tab.badgeValue = value ?? "0"
        }
    }
    static func findPokemonById(id: Int) -> Pokemon? {
        var pokemon:Pokemon?
        pokemons.forEach { elem in
            if elem.id == id {
                pokemon = elem
            }
        }
        return pokemon
    }
    static func findPokemonByName(name: String) -> Pokemon? {
        var pokemon:Pokemon?
        pokemons.forEach { elem in
            if elem.nome.elementsEqual(name) {
                pokemon = elem
            }
        }
        return pokemon
    }
    static func deleteEvolutionsLinkedBy(pokemonId: Int) {
        self.pokemons.forEach { pokemon in
            for x in 0..<pokemon.evolutions.count {
                if(pokemon.evolutions[x].id == pokemonId) {
                    pokemon.evolutions.remove(at: x)
                }
            }
        }
    }
    static func showAlert(view: UIViewController, title: String, message: String) {
        
        let alert = UIAlertController(title: title, message: "\n\(message)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        view.present(alert, animated: true)
    }
    // To custom events
    static func createAlert(title: String, message: String) -> UIAlertController{
        let alert = UIAlertController(title: title, message: "\n\(message)", preferredStyle: .alert)
        return alert
    }
    // Type attack relation system
    static func checkTypeOneIsBetterThan(typeOne: EnumType, typeTwo: EnumType) -> Bool {
        var isBetter:Bool = false
        self.typeAttackSystem[typeOne]?.forEach { elem in
            if elem == typeTwo {
                isBetter = true
            }
        }
        return isBetter
    }
}
