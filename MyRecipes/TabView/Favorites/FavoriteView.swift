//
//  FavoriteView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 04.10.2023.
//

import SwiftUI

struct FavoriteView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                if recipesVM.favoriteRecipes.isEmpty {
                    // No Favorite Recipes
                    ContentUnavailableView("You don't have any favorite recipes yet. Add one.",
                                           systemImage: "heart")
                    .foregroundStyle(.secondary)
                } else {
                    // User have favorite recipes
                    Group {
                        if recipesVM.filteredFavoriteRecipes.isEmpty {
                            ContentUnavailableView.search
                        } else {
                            ScrollView {
                                RecipeList(configuration: .favorites)
                            }
                        }
                    }
                    .searchable(text: $recipesVM.searchFavoritesText, prompt: "Find your favorite recipe")
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
            .environmentObject(RecipesViewModel())
    }
}
