//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Michael Beesley on 1/2/23.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init() {
        
        // create an instance of the data service
        self.recipes = DataService.getLocaldata()
    }
    
    static func getPortion(ingredient:Ingredient, recipeServings:Int, targetServings:Int) -> String {
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            // get a single serving size multiply denominator by the recipe servings
            denominator *= recipeServings
            
            // Get target portion by multiplying numerator by target servings
            numerator *= targetServings
            
            // reduce fraction by greatest common divisor
            let divisor = Rational.greatesCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            // get the whole portion if numerator > denominator
            if numerator >= denominator {
                wholePortions = numerator / denominator
                numerator = numerator % denominator
                portion += String(wholePortions)
            }
            
            // express the remainder as a fraction
            if numerator > 0 {
                portion += wholePortions > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
            }
        }
        
        if var unit = ingredient.unit {
            if wholePortions > 1 {
                // Calculate appropriate suffix
                if unit.suffix(2) == "ch" {
                    unit += "es"
                }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "ves"
                }
                else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
            return portion + unit
        }
        
        return portion
    }
    
}
