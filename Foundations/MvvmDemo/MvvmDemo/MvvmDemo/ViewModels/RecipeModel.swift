//
//  RecipeModel.swift
//  MvvmDemo
//
//  Created by Michael Beesley on 12/28/22.
//

import Foundation

class RecipeModel : ObservableObject {
    @Published var recipes = [Recipe]()
    
    init() {
        // Get the path of the file if it can be found
        let pathStrng = Bundle.main.path(forResource: "data", ofType: "json")
        
        if let path = pathStrng {
            // create a url object
            let url = URL(fileURLWithPath: path)
            
            // Error Handling
            do {
                // code that potentially throws an error
                // create a data object
                let data = try Data(contentsOf: url)
                
                // parse the data
                let decoder = JSONDecoder()
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                // add to list and set a unique id for each recipe
                for recipe in recipeData {
                    recipe.id = UUID()
                    recipes.append(recipe)
                }
                
            }
            catch {
                // Error is the exception variable which is declared implicitly
                print(error)
            }
            
        }
    }
    
    func addRecipe() {
        
    }
}
