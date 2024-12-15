//
//  ShoesItemView.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct ShoesItemView: View {
    
    
    @State var isFavorite:Bool = false
    @StateObject var viewModel = ShoesItemViewModel()
    let shoes: Shoes
    
    var body: some View {
            ZStack(alignment: .topTrailing){
                VStack(alignment: .leading){
                    AsyncImage(
                        url: URL(string: shoes.image),
                        content:{image in
                            image
                                .resizable()
                                .frame(width: 80, height: 80)
                                .scaledToFill()
                                .clipShape(RoundedRectangle(cornerRadius: 6))
                            
                        },
                        placeholder: {
                            ProgressView()
                        }
                    ).frame(width:120,height: 120)
                    VStack(alignment: .leading){
                        Text(String(shoes.price)).font(.title2)
                            .fontWeight(.bold)
                            .padding(.horizontal)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .padding(5)
                        VStack(alignment: .leading){
                            Text(shoes.name)
                            Text(shoes.brand).font(.system(size: 12)).foregroundColor(.gray)
                        }.padding(.leading,10)
                    }
                }
                Button(action: {
                    isFavorite.toggle()
                    isFavorite ? viewModel.AddFavorite(shoe: shoes): viewModel.removeFavorite(shoe: shoes)
                }, label: {
                    Image(systemName: isFavorite ? "heart.fill" :"heart")
                        .foregroundStyle(Color.orange)
                }).buttonStyle(BorderlessButtonStyle()).padding()
    
            }.frame(maxWidth: .infinity, maxHeight: 200)
            .background(RoundedRectangle(cornerRadius: 20).foregroundColor(Color.gray.opacity(0.2)))
    }
}

#Preview {
    ShoesItemView(shoes: Shoes(id: 1, name: "Nike air Zoom", brand: "NIKE", gender: "WOMEN", category: "RUNNING", price: 120,image: "https://d2cva83hdk3bwc.cloudfront.net/nike-air-zoom-pegasus-37-white-cyber-1.jpg"))
}
