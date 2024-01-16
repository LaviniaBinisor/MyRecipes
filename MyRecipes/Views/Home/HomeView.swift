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
            VStack {
                if recipesVM.filteredRecipes.isEmpty {
                    ContentUnavailableView.search
                } else {
                    ScrollView {
                        RecipeList(recipes: recipesVM.filteredRecipes)
                    }
                }
            }
            .searchable(text: $recipesVM.searchText, prompt: "Find a recipe")
            .navigationViewStyle(.stack)
            .navigationTitle("Recipes")
            
            .toolbar {
                Button {
                    showAddRecipe.toggle()
                } label: {
                    Label("Add Recipe", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showAddRecipe) {
                AddOrEditRecipeView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(RecipesViewModel())
    }
}
