//
//  FavoriteView.swift
//  MyRecipes
//
//  Created by lavinia.binisor on 04.10.2023.
//

import SwiftUI

struct FavoriteView: View {
    var body: some View {
        NavigationView {
            Text("You haven't saved any recipe to your favorites yet.")
                .padding()
                .navigationTitle("Favorites")
        }
        .navigationViewStyle(.stack)
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
