//
//  Ingredient.swift
//  RecipeListApp
//
//  Created by Michael Beesley on 1/9/23.
//

import Foundation

class Ingredient : Identifiable, Decodable {
    var id: UUID?
    var name: String
    var num: Int?
    var denom: Int?
    var unit: String?
}
