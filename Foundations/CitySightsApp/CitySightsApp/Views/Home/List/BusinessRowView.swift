//
//  BusinessRowView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/2/23.
//

import SwiftUI

struct BusinessRowView: View {
    
    @ObservedObject var business: Business
    
    var body: some View {
        
        VStack (alignment: .leading) {
            HStack{
                // image
                let uiImage = UIImage(data: business.imageData ?? Data())
                Image(uiImage: uiImage ?? UIImage())
                    .resizable()
                    .frame(width: 58, height: 58)
                    .cornerRadius(15)
                    .scaledToFit()
                
                // name and Distance
                VStack  (alignment: .leading) {
                    Text(business.name ?? "")
                    Text(String(format: "%.1f mi away", (business.distance ?? 0.0) / 1609 ))
                        .font(.caption)
                }
                
                Spacer()
                
                // star rating and num of review
                VStack  (alignment: .leading)  {
                    Image("regular_\(business.rating ?? 0.0)")
                    Text("\(business.reviewCount ?? 0) Reviews")
                        .font(.caption)
                }
            }
            
            DashedDividerView()
                .padding(.vertical)
        }
        .foregroundColor(.black)
    }
}
