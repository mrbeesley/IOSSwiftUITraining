//
//  DataService.swift
//  RecipeListApp
//
//  Created by Michael Beesley on 1/2/23.
//

import Foundation

class DataService {
    
    
    static func getLocaldata() -> [Recipe] {
        
        // parse local json file
        
        // get a url path to the json file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // check if the pathString is not nil, otherwise...
        guard pathString != nil else {
            // the path to the json data was nil 
            return [Recipe]()
        }
        
        // create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
        
            // create a data object
            let data = try Data(contentsOf: url)
            
            // decode the data with a json decoder
            let decoder = JSONDecoder()
            let recipeData = try decoder.decode([Recipe].self, from: data)
            
            // add the unique ids
            for r in recipeData {
                r.id = UUID()
                for i in r.ingredients {
                    i.id = UUID()
                }
            }
            
            // return the recipes
            return recipeData
            
        }
        catch {
            print(error)
        }
        // Something failed just return a blank array
        return [Recipe]()
    }
    
}
