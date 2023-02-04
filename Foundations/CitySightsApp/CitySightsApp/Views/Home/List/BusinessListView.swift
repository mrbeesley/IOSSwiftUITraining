//
//  BusinessList.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/2/23.
//

import SwiftUI

struct BusinessListView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        ScrollView (showsIndicators: false) {
            LazyVStack (alignment: .leading, pinnedViews: [.sectionHeaders]) {
                
                BusinessSectionView(title: "Restaurants", businesses: model.restaurants)
                
                BusinessSectionView(title: "Sights", businesses: model.sights)
                
            }.padding()
        }
    }
}

