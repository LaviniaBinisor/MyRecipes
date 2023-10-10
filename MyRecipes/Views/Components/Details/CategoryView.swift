//
//  CategoryView.swift
//  MyRecipes
//
//  Created by ionut.binisor on 09.10.2023.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    
    //Computed property
    var recipes: [Recipe] {
        return Recipe.allRecipes.filter{ $0.category == category.rawValue }
    }
    
    var body: some View {
        ScrollView {
            RecipeList(recipes: recipes)
        }
        .navigationTitle("My Recipes")
    }
}

#Preview {
    CategoryView(category: Category.dessert)
}
