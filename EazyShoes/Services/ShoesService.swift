//
//  ShoesService.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class ShoesService {
    
    func getShoes(endpoint: String, completion: @escaping(Result<[Shoes], HttpRequestError>) -> Void){
        let url = "\(APIConstants.baseURL)?\(endpoint)"
        print(url)
        
        HttpRequestHelper().GET(url: url) { success, data, message in
            if success{
                guard let data = data else{
                    completion(.failure(.noData))
                    return
                }
                do{
                    let response = try JSONDecoder().decode([ShoesResponse].self, from: data)
                    
                    //let shoes = response.map { result in
                       // result.toShoes()
                    //}
                    
                    // result data
                    completion(.success(response.map { result in
                        result.toShoes()
                    }))
                }catch let error{
                    completion(.failure(.decodingError(error)))
                }
            }else{
                completion(.failure(.noSucces(message ?? "no success")))
            }
        }
    }
}
