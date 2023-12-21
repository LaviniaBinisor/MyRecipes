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
    
    func addRecipe(recipe: Recipe) {
        recipes.append(recipe)
    }
}
 
