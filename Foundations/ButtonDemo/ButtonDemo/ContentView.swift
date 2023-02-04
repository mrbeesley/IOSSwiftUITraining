//
//  ContentView.swift
//  ButtonDemo
//
//  Created by Michael Beesley on 9/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            // Button instance with Closure
            Button("Click Me", action: {
                print("Hello World")
            })
            
            // Button instance with trailing closure
            Button("Click Me") {
                print("Hello trailing closure")
            }
            
            // button instance with label view
            Button {
                print("Hello button with label")
            } label: {
                HStack{
                    Image(systemName: "pencil")
                    Text("Edit")
                }
            }

        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
