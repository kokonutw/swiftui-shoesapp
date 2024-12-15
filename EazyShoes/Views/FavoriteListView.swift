//
//  FavoriteListView.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct FavoriteListView: View {
    
    
    @StateObject var viewModel = FavoriteListViewModel()
    
    var body: some View {
        List{
            ForEach(viewModel.favorites, id: \.self){favorite in
                VStack{
                    HStack{
                        AsyncImage(
                            url: URL(string: favorite.image ?? ""),
                            content:{image in
                                image
                                    .resizable()
                                    .frame(width:90,height: 135)
                                    .scaledToFill()
                                    .clipShape(RoundedRectangle(cornerRadius: 6))
                                
                            },
                            placeholder: {
                                ProgressView()
                            }
                        ).frame(width:90,height: 135)
                        VStack(alignment: .leading){
                            Text(favorite.name ?? "")
                            Text(favorite.brand ?? "")
                            Text(favorite.gender ?? "")
                        }.padding(.leading,4)
                        Spacer()
                    }
                }
            }.onDelete(perform: { indexSet in
                viewModel.removeFavorite(indexSet: indexSet)
            })
        }.onAppear{
            viewModel.getFavorites()
        }
    }
}

#Preview {
    FavoriteListView()
}
