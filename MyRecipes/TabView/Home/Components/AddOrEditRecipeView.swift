//
//  AddRecipeView.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 10.10.2023.
//

import SwiftUI

struct AddOrEditRecipeView: View {
    @EnvironmentObject var recipeVM: RecipesViewModel
    
    @State private var name: String
    @State private var selectedCategory: Category
    @State private var description: String
    @State private var ingredients: String
    @State private var directions: String
   
    @Environment(\.dismiss) var dismiss
    
    let existingRecipe: Recipe?
    
    init(existingRecipe: Recipe? = nil) {
        // Edit flow
        if let existingRecipe {
            self.existingRecipe = existingRecipe
            
            self._name = State(initialValue: existingRecipe.name)
            self._selectedCategory = State(initialValue: Category(rawValue: existingRecipe.category) ?? .main)
            self._description = State(initialValue: existingRecipe.description)
            self._ingredients = State(initialValue: existingRecipe.ingredients.joined(separator: ", "))
            self._directions = State(initialValue: existingRecipe.directions.joined(separator: ", "))
        } else {
            // Add flow
            self.existingRecipe = nil
            
            self._name = State(initialValue: "")
            self._selectedCategory = State(initialValue: .main)
            self._description = State(initialValue: "")
            self._ingredients = State(initialValue: "")
            self._directions = State(initialValue: "")
        }
    }
    
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
            .navigationTitle(navTitle)
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationSplitViewStyle(.automatic)
    }
    
    var navTitle: String {
       existingRecipe == nil ? "New Recipe" : "Edit Recipe"
    }
}

private extension AddOrEditRecipeView {
    func saveRecipe() {
            // Edit
        if var existingRecipe = existingRecipe {
            
            existingRecipe.name = name
            existingRecipe.category = selectedCategory.name
            existingRecipe.description = description
            existingRecipe.ingredients = ingredients.components(separatedBy: ", ")
            existingRecipe.directions = directions.components(separatedBy: ", ")
            // Save (replace the old receipe with the new one)
              
            // Save the Edit
            recipeVM.saveEdit(recipe: existingRecipe)
        } else {
            // Add New Recipe
            let recipe = Recipe(
                name: name, image: "",
                description: description,
                ingredients: [ingredients],
                directions: [directions], category: selectedCategory.rawValue, url: ""
            )
            
            recipeVM.addRecipe(recipe: recipe)
        }
    }
}

#Preview {
    AddOrEditRecipeView()
        .environmentObject(RecipesViewModel())
}
