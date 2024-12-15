//
//  ShoesListViewModel.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import Foundation

class ShoesListViewModel: ObservableObject{

    @Published var shoes:[Shoes] = []
    @Published var errorMessage: String? = nil
    @Published var isLoading: Bool = false
    
    @Published var endpoit = APIEndPoint.women
    
    
    private let shoesService = ShoesService()
    
    
    init(){
        getShoes()
    }
    
    
    func updateEndpoint(endpoint: APIEndPoint){
        self.endpoit = endpoint
        self.shoes = []
        self.errorMessage = nil
        getShoes()
    }
    
    
    func getShoes(){
        isLoading = true
        errorMessage = nil
        
        shoesService.getShoes(endpoint: endpoit.rawValue) { result in
            DispatchQueue.main.async {
                self.isLoading = false
                switch result {
                case .success(let shoes):
                    self.shoes.append(contentsOf: shoes)
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                }
            }
        }
    }
}
