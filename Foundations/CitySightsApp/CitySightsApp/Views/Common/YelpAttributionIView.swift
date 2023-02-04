//
//  YelpAttributionIView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/4/23.
//

import SwiftUI

struct YelpAttributionIView: View {
    
    var link: String
    
    var body: some View {
        
        Link(destination: URL(string: link)!) {
            Image("yelp")
                .resizable()
                .scaledToFit()
                .frame(height: 36)
        }
    }
}

struct YelpAttributionIView_Previews: PreviewProvider {
    static var previews: some View {
        YelpAttributionIView(link: "https://yelp.com")
    }
}
