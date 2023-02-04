//
//  ContentView.swift
//  NavigationLinkDemo
//
//  Created by Michael Beesley on 1/19/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex: Int?
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                NavigationLink (
                    destination: SecondView(selectedIndex: $selectedIndex).onAppear(perform: {
                        print(selectedIndex)
                    }),
                    tag: 1,
                    selection: $selectedIndex,
                    label: {
                        Text("Navigation Link 1")
                })
                
                NavigationLink(
                    destination: SecondView(selectedIndex: $selectedIndex).onAppear(perform: {
                        print(selectedIndex)
                    }),
                    tag: 2,
                    selection: $selectedIndex,
                    label: {
                        Text("Navigation Link 2")
                    })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
