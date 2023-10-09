//
//  Categories.swift
//  MyRecipes
//
//  Created by lavinia.binisor on 04.10.2023.
//

import SwiftUI

struct CategoriesView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(Category.allCases) { category in
                    NavigationLink {
                        ScrollView {
                            RecipeList(recipes: Recipe.allRecipes.filter{ $0.category == category.rawValue })
                        }
                    } label: {
                        Text(category.rawValue + "s")
                    }
                }
            }
            .navigationTitle("Categories")
        }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Preview: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
