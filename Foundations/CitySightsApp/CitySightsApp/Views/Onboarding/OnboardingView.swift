//
//  OnboardingView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/3/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @EnvironmentObject var model: ContentModel
    @State private var tabSelection = 0
    
    private let blue = Color(red: 0/255, green: 130/255, blue: 167/255)
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        VStack {
            
            // MARK: - TAB VIEW
            TabView(selection: $tabSelection) {
                // First Tab
                VStack (spacing: 20) {
                    Image("city2")
                        .resizable()
                        .scaledToFit()
                    Text("Welcome to City Sights!")
                        .bold()
                        .font(.title)
                    Text("City Sights helps you find the best of the city!")
                        
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .tag(0)
                
                // Second Tab
                VStack (spacing: 20) {
                    Image("city1")
                        .resizable()
                        .scaledToFit()
                    Text("Ready to discover your city?")
                        .bold()
                        .font(.title)
                    Text("We'll show you the best restaurants, venues and more, based on your location!")
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .tag(1)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button {
                // detect which tab it is
                if tabSelection == 0 {
                    tabSelection = 1
                }
                else {
                    // Request for geo location permission
                    model.requestGeoLocationPermission()
                    
                }
            } label: {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .frame(height: 48)
                        .cornerRadius(10)
                    
                    Text(tabSelection == 0 ? "Next" : "Get My Location")
                        .bold()
                        .padding()
                }
            }
            .accentColor(tabSelection == 0 ? blue : turquoise)
            .padding()

        }
        .background(tabSelection == 0 ? blue : turquoise)
    }
}
