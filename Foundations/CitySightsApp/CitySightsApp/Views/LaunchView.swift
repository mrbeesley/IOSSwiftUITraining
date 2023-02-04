//
//  ContentView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 1/27/23.
//

import SwiftUI
import CoreLocation

struct LaunchView: View {
    
    @EnvironmentObject var model: ContentModel
    
    
    var body: some View {
        
        
        // Detect the authorization status of geolocating the user
        
        if model.authorizationState == .notDetermined {
            // if undetermined show onboarding
            OnboardingView()
        }
        else if model.authorizationState == .authorizedWhenInUse || model.authorizationState == .authorizedAlways {
            // if approved show hoome view
            HomeView()
        }
        else {
            // if denied show denied view
            LocationDeniedView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
