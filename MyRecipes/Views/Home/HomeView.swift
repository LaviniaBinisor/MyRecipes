//
//  HomeView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 04.10.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var recipesVM: RecipesViewModel
    @State private var showAddRecipe = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                RecipeList(recipes: recipesVM.recipes)
            }
            .navigationTitle("My Recipes")
            .toolbar {
                Button {
                    showAddRecipe.toggle()
                } label: {
                    Label("Add Recipe", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showAddRecipe) {
                AddRecipeView()
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipesViewModel())
    }
}
