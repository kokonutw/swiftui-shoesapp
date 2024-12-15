//
//  FavoriteListViewModel.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class FavoriteListViewModel: ObservableObject{
    @Published var favorites:[ShoesEntity] = []
    
    
    let shoesDao = ShoesDAO()
    
    func getFavorites(){
        favorites = shoesDao.fetchAll()
    }
    func removeFavorite(indexSet: IndexSet){
        guard let index = indexSet.first else {
            return
        }
        shoesDao.delete(by: Int(favorites[index].id))
    }
}
