//
//  ContentView.swift
//  TabViewDemo
//
//  Created by Michael Beesley on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var tabIndex = 1
    
    var body: some View {
        
        TabView (selection: $tabIndex) {
            VStack {
                Text("This is tab " + String(tabIndex))
                }
            .tabItem {
                    VStack {
                        Image(systemName: "pencil")
                        Text("Tab 1")
                    }
            }.tag(1)
            VStack {
                Text("This is tab " + String(tabIndex))
                Text("this is some more text")
            }
            .tabItem{
                VStack {
                    Image(systemName: "star")
                    Text("Tab 2")
                }
            }.tag(2)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
