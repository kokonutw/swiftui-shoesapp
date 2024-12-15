//
//  ShoesListView.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct ShoesListView: View {
    
    @ObservedObject var viewModel: ShoesListViewModel
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView{
            if viewModel.isLoading{
                ProgressView("Cargando productos..")
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else if let errorMessage = viewModel.errorMessage{
                Text("Error: \(errorMessage)")
                      .multilineTextAlignment(.center)
                      .frame(maxWidth: .infinity, maxHeight: .infinity)
            }else{
                ScrollView{
                    LazyVGrid(columns: columns,spacing: 20){
                        ForEach(viewModel.shoes){shoes in
                            ShoesItemView(shoes: shoes)
                        }
                    }
                    .padding()
                }
            }
            
            
        }
    }
}
