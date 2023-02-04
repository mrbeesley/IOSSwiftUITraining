//
//  LearningAppApp.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/13/23.
//

import SwiftUI

@main
struct LearningApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(ContentModel())
        }
    }
}
