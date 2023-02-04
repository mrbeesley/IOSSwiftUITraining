//
//  LocationDeniedView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/3/23.
//

import SwiftUI

struct LocationDeniedView: View {
    
    let backgroundColor = Color(red: 34/244, green: 141/255, blue: 138/255)
    
    var body: some View {
        
        
        // the zstack witll allow us to put the background color on the entire screen
        ZStack {
            
            // puts the background color behind teh vstack with the text
            backgroundColor
            
            VStack (spacing: 20) {
                Spacer()
                
                Text("Whoops!")
                    .font(.title)
                
                Text("We need to access your location to provide you with the best sights in the area! Change your decision at anytime in settings.")
                
                Spacer()
                
                Button {
                    // open settings
                    if let url = URL(string: UIApplication.openSettingsURLString) {
                        if UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url)
                        }
                    }
                } label: {
                    
                    ZStack {
                        Rectangle()
                            .foregroundColor(.white)
                            .frame(height: 48)
                            .cornerRadius(10)
                        Text("Go to Settings")
                            .bold()
                            .foregroundColor(backgroundColor)
                    }
                    
                    
                }
                
                Spacer()
                
            }
            .multilineTextAlignment(.center)
            .padding()
        }.ignoresSafeArea()
    }
}

struct LocationDeniedView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDeniedView()
    }
}
