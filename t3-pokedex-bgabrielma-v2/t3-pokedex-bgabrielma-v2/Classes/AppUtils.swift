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
}
