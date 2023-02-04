//
//  Lesson.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/13/23.
//

import Foundation

struct Lesson : Decodable, Identifiable {
    var id: Int
    var title: String
    var video: String
    var duration: String
    var explanation: String
    
}
