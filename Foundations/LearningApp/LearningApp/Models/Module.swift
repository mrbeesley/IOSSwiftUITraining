//
//  Module.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/13/23.
//

import Foundation

struct Module : Decodable, Identifiable {
    var id: Int
    var category: String
    var content: Content
    var test: Test
}
