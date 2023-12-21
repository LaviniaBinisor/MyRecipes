//
//  MyRecipesApp.swift
//  MyRecipes
//
//  Created by Lavinia Maria Binisor on 04.10.2023.
//

import SwiftUI

@main
struct MyRecipesApp: App {
    @StateObject var recipesViewModel = RecipesViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(recipesViewModel)
        }
    }
}
