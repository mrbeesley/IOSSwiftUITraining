//
//  DirectionsView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/3/23.
//

import SwiftUI

struct DirectionsView: View {
    
    var business: Business
    
    var body: some View {
        VStack (alignment: .leading) {
            
            
            HStack {
                // Business title
                BusinessTitleView(
                    name: business.name ?? "",
                    address: business.location?.displayAddress ?? [String](),
                    rating: String(business.rating ?? 0.0))
                Spacer()
                if let lat = business.coordinates?.latitude,
                   let long = business.coordinates?.longitude,
                   let name = business.name?.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
                    Link("Open in Maps",
                         destination: URL(string: "http://maps.apple.com/?ll=\(lat),\(long)&q=\(name)!)")!)
                }
                
            }.padding()
            
            // Directions map
            DirectionsMap(business: business)
        }
        .ignoresSafeArea(.all, edges: .bottom)
    }
}
