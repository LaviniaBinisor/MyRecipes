//
//  RecipeView.swift
//  MyRecipes
//
//  Created by ionut.binisor on 06.10.2023.
//

import SwiftUI

struct RecipeView: View {
    var recipe: Recipe
    
    var body: some View {
        ScrollView(.vertical) {
            headerImage
            
            VStack(spacing: 20) {
                titleSection
                
                if !recipe.ingredients.isEmpty {
                    composeSection(title: "Ingredients", components: recipe.ingredients)
                }
                
                if !recipe.instructions.isEmpty {
                    composeSection(title: "Directions", components: recipe.instructions)
                }
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea(edges: .top)
    }
}

// MARK: View Components
extension RecipeView {
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
        RecipeView(recipe: Recipe.allRecipes.randomElement()!)
    }
}
