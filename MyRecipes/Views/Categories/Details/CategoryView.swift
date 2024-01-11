//
//  CategoryView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 09.10.2023.
//

import SwiftUI

struct CategoryView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    var category: Category
    
    //Computed property
    var recipes: [Recipe] {
        return recipesVM.recipes.filter { $0.category == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            // TODO: is Constant appropriate here?
            RecipeList(recipes: recipes)
        }
        .navigationTitle("My Recipes")
    }
}

#Preview {
    CategoryView(category: Category.dessert)
        .environmentObject(RecipesViewModel())
}
