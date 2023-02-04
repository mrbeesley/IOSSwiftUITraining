//
//  Question.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/13/23.
//

import Foundation

struct Question : Decodable, Identifiable {
    var id: Int
    var content: String
    var correctIndex: Int
    var answers: [String]
}
