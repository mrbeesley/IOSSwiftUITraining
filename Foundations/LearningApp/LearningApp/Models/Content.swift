//
//  Content.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/13/23.
//

import Foundation

struct Content : Decodable, Identifiable {
    var id: Int
    var image: String
    var time: String
    var description: String
    var lessons: [Lesson]
    
}
