//
//  RecipeListApp.swift
//  RecipeListApp
//
//  Created by Michael Beesley on 12/31/22.
//

import SwiftUI

@main
struct RecipeListApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(RecipeModel())
        }
    }
}
