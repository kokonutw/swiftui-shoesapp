//
//  ShoesItemViewModel.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class ShoesItemViewModel: ObservableObject{
    let shoesDao = ShoesDAO()
    func AddFavorite(shoe: Shoes){
        shoesDao.insert(shoes: shoe)
    }

    func removeFavorite(shoe: Shoes){
        shoesDao.delete(by: shoe.id)
    }
    
}
