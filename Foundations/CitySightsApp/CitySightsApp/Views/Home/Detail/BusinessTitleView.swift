//
//  BusinessTitleView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/3/23.
//

import SwiftUI

struct BusinessTitleView: View {
    
    //var business: Business
    var name:String
    var address:[String]
    var rating:String
    
    var body: some View {
        VStack (alignment: .leading) {
            // Business name
            Text(name)
                .font(.title2)
                .bold()
                .lineLimit(1)
            
            // Loop through display address
            ForEach(address, id: \.self) { displayLine in
                Text(displayLine)
            }
            
            // Rating
            Image("regular_\(rating)")
            
        }
        
    }
}

struct BusinessTitleView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessTitleView(name: "Bella Napoli", address: ["14 W 62nd ST", "Kansas City, MO 64113"], rating: "5.0")
    }
}
