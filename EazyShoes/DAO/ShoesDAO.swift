//
//  ShoesDAO.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation
import CoreData

class ShoesDAO{
    let context = PersistenceController.shared.container.viewContext
    
    func insert(shoes: Shoes){
        let favorite = ShoesEntity(context: context)
        
        favorite.id = Int32(shoes.id)
        favorite.name = shoes.name
        favorite.brand = shoes.brand
        favorite.gender = shoes.gender
        favorite.price = Int32(shoes.price)
        favorite.image = shoes.image
        
        saveContext()
    }
    
    func delete(by id: Int){
        let request = NSFetchRequest<ShoesEntity>(entityName: "ShoesEntity")
        
        request.predicate = NSPredicate(format: "id == %i", id)
        do{
           let favorites = try context.fetch(request)
            for favorite in favorites{
                context.delete(favorite)
            }
            saveContext()
        }catch let error{
            print("Error:\(error.localizedDescription)")
            context.rollback()
        }
    }
    
    func fetchAll() -> [ShoesEntity]{
        let request = NSFetchRequest<ShoesEntity>(entityName: "ShoesEntity")
        
        do{
           return try context.fetch(request)

        }catch let error{
            print("Error:\(error.localizedDescription)")
        }
        return []
    }
    
    private func saveContext(){
        if context.hasChanges{
            do{
                try context.save()
            }catch let error{
                print("Error: \(error.localizedDescription)")
                context.rollback()
            }
        
        }
    }
}
