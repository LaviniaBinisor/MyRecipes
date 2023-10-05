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
            Text("Categories")
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
