//
//  MainTabView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 04.10.2023.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
//            CategoriesView()
//                .tabItem {
//                    Label("Categories", systemImage: "square.fill.text.grid.1x2")
//                }
            
            FavoriteView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(RecipesViewModel())
    }
}
