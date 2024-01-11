//
//  RecipiesviewModel.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 10.10.2023.
//

import Foundation

class RecipesViewModel: ObservableObject {
    @Published private(set) var recipes: [Recipe] = []
    
    init() {
        recipes = Recipe.allRecipes
    }
}

extension RecipesViewModel {
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
    
    func saveEdit(recipe: Recipe) {
        if let index = recipes.firstIndex(where: { $0.id == recipe.id }) {
            recipes[index] = recipe
        }
    }
}
 
