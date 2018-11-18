//
//  FavouriteList.swift
//  Lab5-Nav
//
//  Created by Matin Salehi on 2018-11-17.
//  Copyright © 2018 Matin Salehi. All rights reserved.
//

import UIKit

class FavouritesList {

    static let sharedFavouritesList =  FavouritesList()

    private(set) var favourites:[String]
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
        
    }
    
    func addFavourite(fontName: String) {
        if !favourites.contains(fontName){
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    func saveFavourites() {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    func removeFavourites(fontName: String){
        if let index = favourites.index(of: fontName){
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    func moveItem(fromIndex from: Int, toIndex to: Int){
        let item = favourites[from]
        favourites.remove(at: from)
        favourites.insert(item, at: to)
        saveFavourites()
    }

}
