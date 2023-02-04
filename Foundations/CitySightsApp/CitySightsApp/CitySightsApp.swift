//
//  CitySightsApp.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 1/27/23.
//

import SwiftUI

@main
struct CitySightsApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView().environmentObject(ContentModel())
        }
    }
}
