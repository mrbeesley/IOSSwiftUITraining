//
//  BusinessSectionHeaderView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/2/23.
//

import SwiftUI

struct BusinessSectionHeaderView: View {
    
    var title : String
    
    var body: some View {
        
        
        ZStack(alignment: .leading) {
            
            Rectangle()
                .foregroundColor(.white)
            
            Text(title)
                .font(.headline)
        }
        
        
    }
}
