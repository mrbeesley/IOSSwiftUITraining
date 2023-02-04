//
//  HomeView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/2/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var model : ContentModel
    @State var isMapShowing = false
    @State var selectedBusiness: Business?
    
    var body: some View {
        
        if model.restaurants.count != 0 || model.sights.count != 0 {
            
            NavigationView {
                // Determine if we should show list or map
                if !isMapShowing {
                    VStack (alignment: .leading) {
                        HStack {
                            Image(systemName: "location")
                            Text(model.placemark?.locality ?? "")
                            Spacer()
                            Button("Switch to Map View") {
                                self.isMapShowing = true
                            }
                        }
                        
                        Divider()
                        
                        ZStack (alignment: .top) {
                            
                            BusinessListView()
                            
                            HStack {
                                Spacer()
                                YelpAttributionIView(link: "https://yelp.com")
                            }
                            .padding(.trailing, -5)
                        }
                    }
                    .padding([.horizontal, .top])
                    .navigationBarHidden(true)
                }
                else {
                    ZStack(alignment: .top) {
                        BusinessMap(selectedBusiness: $selectedBusiness)
                            .sheet(item: $selectedBusiness) { business in
                                
                                // Create a business detail view instance
                                // pass in teh selected business
                                BusinessDetailView(business: business)
                            }
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white)
                                .cornerRadius(5)
                                .frame(height: 48)
                            
                            HStack {
                                Image(systemName: "location")
                                Text(model.placemark?.locality ?? "")
                                Spacer()
                                Button("Switch to list View") {
                                    self.isMapShowing = false
                                }
                            }
                            .padding()
                        }
                        .padding()
                    }
                    .ignoresSafeArea(.all, edges: .bottom)
                   
                }
            }
        }
        else {
            // still waiting for the data so show spinner
            ProgressView()
        }
        
    }
}
