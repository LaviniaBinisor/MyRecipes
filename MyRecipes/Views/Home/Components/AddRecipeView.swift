//
//  AddRecipeView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 10.10.2023.
//

import SwiftUI

struct AddRecipeView: View {
    @EnvironmentObject var recipeVM: RecipesViewModel
    
    @State private var name: String = ""
    @State private var selectedCategory: Category = Category.main
    @State private var description: String = ""
    @State private var ingredients: String = ""
    @State private var directions: String = ""
    @State private var navigateToRecipe = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Recipe Name", text: $name)
                } header: {
                    Text("Name")
                }
                
                Section {
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(Category.allCases) { category in
                            Text(category.rawValue)
                                .tag(category)
                        }
                    }
                    .pickerStyle(.menu)
                } header: {
                    Text("Category")
                }
                
                Section {
                    TextEditor(text: $description)
                } header: {
                    Text("Description")
                }
                
                Section {
                    TextEditor(text: $ingredients)
                } header: {
                    Text("Ingredinets")
                }
                
                Section {
                   TextEditor(text: $directions)
                } header: {
                    Text("Directions")
                } footer: {
                    Text("Steps you need to follow.")
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Label("Cancel", systemImage: "xmark")
                            .labelStyle(.iconOnly)
                    }
                }
                
                ToolbarItem {
                    Button {
                        saveRecipe()
                        dismiss()
                    } label: {
                        Label("Done", systemImage: "checkmark")
                            .labelStyle(.iconOnly)
                    }
                    .disabled(name.isEmpty)
                }
            }
            .navigationTitle("New Recipe")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationSplitViewStyle(.automatic)
    }
}

private extension AddRecipeView {
    func saveRecipe() {
        let recipe = Recipe(
            name: name, image: "", description: description, ingredients: [ingredients],
            instructions: [directions], category: selectedCategory.rawValue, url: "")
        
        recipeVM.addRecipe(recipe: recipe)
    }
}

#Preview {
    AddRecipeView()
        .environmentObject(RecipesViewModel())
}
