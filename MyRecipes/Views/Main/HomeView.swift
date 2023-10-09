//
//  HomeView.swift
//  MyRecipes
//
//  Created by lavinia.binisor on 04.10.2023.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: Recipe.allRecipes)
            }
            .navigationTitle("My Recipes")
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
