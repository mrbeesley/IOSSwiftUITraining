//
//  ContentView.swift
//  ForEachDemo
//
//  Created by Michael Beesley on 1/4/23.
//

import SwiftUI

struct ContentView: View {
    
    var array = ["Pizza", "Burrito", "Sushi"]
    
    var body: some View {
        ScrollView {
            ForEach(array, id: \.self) { r in
                Text(r)
            }
            ForEach(0..<array.count, id: \.self) { index in
                Text(String(index) + " " + array[index])
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
