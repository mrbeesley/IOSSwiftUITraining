//
//  BusinessSectionView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/2/23.
//

import SwiftUI

struct BusinessSectionView: View {
    
    var title:String
    var businesses:[Business]
    
    var body: some View {
        
        Section (header: BusinessSectionHeaderView(title: title)) {
            
            ForEach(businesses) { business in
                
                NavigationLink(destination: BusinessDetailView(business: business)) {
                    BusinessRowView(business: business)
                }
                
                
                
            }
        }
    }
}
