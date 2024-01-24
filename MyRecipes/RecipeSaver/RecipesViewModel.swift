//
//  RecipiesviewModel.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 10.10.2023.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = Recipe.allRecipes
    // Home
    @Published var searchText = ""
    
    // Favorites
    @Published var searchFavoritesText = ""
}

// MARK: Home
extension RecipesViewModel {
    // It is used in HomeView and helps for Search too.
    var homeFilteredRecipes: [Recipe] {
        guard !searchText.isEmpty else { return recipes }
        
        return recipes.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
    }
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func saveEdit(recipe: Recipe) {
        if let index = getIndex(for: recipe) {
            recipes[index] = recipe
        }
    }
    
    func toggleFavorites(for recipe: Recipe) {
        // 1. Toggle isFavorite property
        var temporaryRecipe = recipe
        temporaryRecipe.isFavorite.toggle()
        
        // 2. Replace old recipe with the new one
        if let index = getIndex(for: recipe) {
            recipes[index] = temporaryRecipe
        }
    }
    
    func getIndex(for recipe: Recipe) -> Array.Index? {
        recipes.firstIndex { currentRecipe in
            currentRecipe.id == recipe.id
        }
    }
}

// MARK: Favorites
extension RecipesViewModel {
    var favoriteRecipes: [Recipe] {
        recipes
            .filter { recipe in
                recipe.isFavorite == true
            }
    }
    
    var filteredFavoriteRecipes: [Recipe] {

        // Search text is not empty
        guard searchFavoritesText.isEmpty == false else {
            return favoriteRecipes
        }
        
        return favoriteRecipes
            .filter { recipe in
                let nameMatcheSearchText = recipe.name.localizedCaseInsensitiveContains(searchFavoritesText)
                return nameMatcheSearchText
            }
    }
}
