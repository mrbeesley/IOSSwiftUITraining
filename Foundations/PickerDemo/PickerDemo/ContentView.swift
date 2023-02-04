//
//  ContentView.swift
//  PickerDemo
//
//  Created by Michael Beesley on 1/11/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var selectedIndex = "1"
    
    var body: some View {
        
        VStack {
            Picker("Tap Me", selection: $selectedIndex) {
                Text("Option 1").tag("1")
                Text("Option 2").tag("2")
                Text("Option 3").tag("3")
            }
            .pickerStyle(SegmentedPickerStyle())
            
            Text("You've Selected: \(selectedIndex)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
