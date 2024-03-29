//
//  RecipeCard.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 05.10.2023.
//

import SwiftUI

struct RecipeCard: View {
    let recipe: Recipe
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            AsyncImage(url: URL(string: recipe.image)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .overlay(alignment: .bottom) {
                        Text(recipe.name)
                            .font(.title2)
                            .foregroundStyle(Color.white)
                            .frame(maxWidth: 140)
                            .shadow( color: Color.black, radius: 3, x: 0, y: 0)
                    }
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.white.opacity(0.5))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            .frame(width: 160, height: 220, alignment: .top)
            .background(LinearGradient(gradient: Gradient(colors: [Color(.gray).opacity(0.3), Color(.gray)]), startPoint: .top, endPoint: .bottom))
            .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            .shadow(color: Color.black.opacity(0.3), radius: 15, x: 1, y: 6)
           
            Image(systemName: "heart")
                .fontWeight(.semibold)
                .font(.title3)
                .symbolVariant(recipe.isFavorite ? .fill : .none)
                .foregroundStyle(recipe.isFavorite ? Color.red : Color.black)
                .padding(10)
        }
    }
}

struct RecipeCard_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCard(recipe: Recipe.allRecipes[1])
    }
}
