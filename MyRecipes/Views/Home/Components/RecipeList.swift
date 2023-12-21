//
//  RecipeList.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 05.10.2023.
//

import SwiftUI

struct RecipeList: View {
    var recipes: [Recipe]
    
    var body: some View {
        VStack {
            Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
                .font(.headline)
                .foregroundStyle(.primary)
                .fontWeight(.medium)
            
            Spacer()
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 2)], spacing: 20) {
                ForEach(recipes) { recipe in
                    NavigationLink(destination: RecipeView(recipe: recipe)) {
                        RecipeCard(recipe: recipe)
                    }
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(recipes: Recipe.allRecipes)
        }
    }
}
