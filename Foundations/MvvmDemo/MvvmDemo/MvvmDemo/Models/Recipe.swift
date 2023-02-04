//
//  Recipe.swift
//  MvvmDemo
//
//  Created by Michael Beesley on 12/28/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name = ""
    var cuisine = ""
    
}
