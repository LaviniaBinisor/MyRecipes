//
//  RecipeList.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 05.10.2023.
//

import SwiftUI

enum TabConfiguration {
    case home
    case favorites
}

struct RecipeList: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    let configuration: TabConfiguration
    
    var body: some View {
        VStack(spacing: 16) {
            countTitle
            
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 150), spacing: 2)], spacing: 20) {
                ForEach(recipes) { recipe in
                    cardView(for: recipe)
                }
            }
            .padding(.top)
        }
        .padding(.horizontal)
    }
    
    var recipes: [Recipe] {
        switch configuration {
        case .home:
            return recipesVM.homeFilteredRecipes
        case .favorites:
            return recipesVM.filteredFavoriteRecipes
        }
    }
    
    var countTitle: some View {
        Text("\(recipes.count) \(recipes.count > 1 ? "recipes" : "recipe")")
            .font(.headline)
            .foregroundStyle(.primary)
            .fontWeight(.medium)
    }
    
    func cardView(for recipe: Recipe) -> some View {
        NavigationLink(destination: RecipeDetailsView(recipe: recipe)) {
            RecipeCard(recipe: recipe)
        }
        .contextMenu {
            Button {
                recipesVM.toggleFavorites(for: recipe)
            } label: {
                Label("\(recipe.isFavorite ? "Remove from Favorites" : "Add To Favorites")",
                      systemImage: recipe.isFavorite ? "heart.fill" : "heart")
            }
        }
    }
}

struct RecipeList_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            RecipeList(configuration: .home)
                .environmentObject(RecipesViewModel())
        }
    }
}
