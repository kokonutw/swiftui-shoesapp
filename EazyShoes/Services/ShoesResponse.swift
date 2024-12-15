//
//  ShoesResponse.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation




struct ShoesResponse:Decodable {
    let id: Int
    let name:String
    let brand:String
    let gender: String
    let category: String
    let price: Int
    let image: String
    func toShoes() -> Shoes{
        return Shoes(id: id, name: name, brand: brand, gender: gender, category: category, price: price,image: image)
    }
}

