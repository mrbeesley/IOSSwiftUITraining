//
//  ContentView.swift
//  Shared
//
//  Created by Michael Beesley on 9/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack{
            
            Spacer()
            
            Image("war-logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            HStack() {
                Spacer()
                Text("Hello")
                Text("World")
                Spacer()
            }
            
            Spacer()
            
        }
    
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
