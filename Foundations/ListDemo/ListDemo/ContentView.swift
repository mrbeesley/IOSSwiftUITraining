//
//  ContentView.swift
//  ListDemo
//
//  Created by Michael Beesley on 9/23/22.
//

import SwiftUI

struct ContentView: View {
    
    var array = ["Element 1", "Element 2", "Element 3", "Element 4", "Element 5"]
    
    
    var body: some View {
        
        NavigationView {
            List(array, id: \.self) { arrayElement in
                NavigationLink(
                    destination:Text("Destination"),
                    label: {
                        Text(arrayElement)
                    })
                
            }.navigationBarTitle(Text("My List"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
