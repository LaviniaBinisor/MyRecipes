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
        ScrollView {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100, alignment: .center)
                    .foregroundColor(.white.opacity(0.3))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(height: 300)
            .background(LinearGradient(gradient: Gradient(colors: [Color.gray.opacity(0.3)]), startPoint: .top, endPoint: .bottom))
            .padding()
            
            VStack(spacing: 30) {
                Text(recipe.name)
                    .font(.largeTitle)
                    .bold()
                    .multilineTextAlignment(.center)
                
                VStack(spacing: 30) {
                    if !recipe.description.isEmpty {
                    Text(recipe.description)
                        .font(.title3)
                    }
                    
                    if !recipe.ingredients.isEmpty {
                        VStack(spacing: 20) {
                            Text("Ingredients")
                                .font(.title2)
                                .italic()
                            
                            Text(recipe.ingredients)
                                .multilineTextAlignment(.center)
                        }
                    }
                    
                    if !recipe.instruction.isEmpty {
                        VStack(spacing: 20) {
                            Text("Instruction")
                                .font(.title2)
                                .italic()
                            
                            Text(recipe.instruction)
                            
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.horizontal)
        }
        .ignoresSafeArea()
    }
}

struct RecipeView_Preview: PreviewProvider {
    static var previews: some View {
        RecipeView(recipe: Recipe.allRecipes[0])
    }
}
