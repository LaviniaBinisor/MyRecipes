//
//  RecipeDetailsView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 06.10.2023.
//

import SwiftUI

struct RecipeDetailsView: View {
    var recipe: Recipe
    @State private var showEditRecipe = false
    
    var body: some View {
        ScrollView(.vertical) {
            headerImage
            
            VStack(spacing: 20) {
                titleSection
                
                if !recipe.ingredients.isEmpty {
                    composeSection(title: "Ingredients", components: recipe.ingredients)
                }
                
                if !recipe.directions.isEmpty {
                    composeSection(title: "Directions", components: recipe.directions)
                }
            }
            .padding(.horizontal)
        }
        .toolbar {
            Button {
                showEditRecipe.toggle()
            } label: {
                Text("Edit")
            }
        }
        .sheet(isPresented: $showEditRecipe) {
            AddOrEditRecipeView(existingRecipe: recipe)
        }
    }
}

// MARK: View Components
extension RecipeDetailsView {
    var headerImage: some View {
        AsyncImage(url: URL(string: recipe.image)) { image in
            image
                .resizable()
                .scaledToFill()
            
        } placeholder: {
            Image(systemName: "photo")
                .font(.largeTitle)
                .foregroundColor(.secondary)
                .scaleEffect(5)
                .overlay(
                    ProgressView()
                        .scaleEffect()
                )
        }
        .frame(height: UIScreen.main.bounds.height * 0.35)
        .frame(width: UIScreen.main.bounds.width)
        .clipShape(
            RoundedRectangle(cornerRadius: 30)
        )
    }
    
    @ViewBuilder
    var titleSection: some View {
        Text(recipe.name)
            .font(.largeTitle)
            .lineLimit(2)
            .bold()
            .multilineTextAlignment(.center)
        
        if !recipe.description.isEmpty {
            Text(recipe.description)
                .font(.title3)
                .padding(.top, -10)
        }
    }
    
    @ViewBuilder
    func composeSection(title: String, components: [String]) -> some View {
        if !recipe.ingredients.isEmpty {
            Text(title)
                .font(.title3)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            VStack(alignment: .leading, spacing: 12) {
                ForEach(components, id: \.self) { ingredient in
                    Label {
                        Text(ingredient)
                    } icon: {
                        Image(systemName: "circle")
                            .font(.caption)
                    }
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
        }
    }
}

struct RecipeView_Preview: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: Recipe.allRecipes[0])
    }
}
