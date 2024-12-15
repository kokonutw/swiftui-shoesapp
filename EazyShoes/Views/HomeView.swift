//
//  HomeView.swift
//  EazyShoes
//
//  Created by Alumno on 11/12/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView{
            ShoesView().tabItem {
                Label("Shoes", systemImage: "shoeprints.fill")
            }
            FavoriteListView().tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
        }
    }
}

#Preview {
    HomeView()
}
