//
//  Categories.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 04.10.2023.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    rowView(category: category)
                }
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
    
    func rowView(category: Category) -> some View {
        NavigationLink {
            ScrollView {
                // TODO: remove .constant for binding
                RecipeList(recipes: Recipe.allRecipes.filter{ $0.category == category.rawValue })
            }
        } label: {
            Text(category.rawValue + "s")
        }
    }
}

struct CategoriesView_Preview: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
