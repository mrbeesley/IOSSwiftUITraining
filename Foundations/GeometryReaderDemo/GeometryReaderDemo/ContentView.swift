//
//  ContentView.swift
//  GeometryReaderDemo
//
//  Created by Michael Beesley on 1/9/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            
            GeometryReader { geo in
                Rectangle()
                    .frame(width: geo.size.width/4, height: geo.size.height/8, alignment: .center)
                    .onTapGesture {
                        print("Global - x: \(geo.frame(in: .global).minX), y: \(geo.frame(in: .global).minY)")
                        print("Local - x: \(geo.frame(in: .local).minX), y: \(geo.frame(in: .local).minY)")
                }
                
                // Offset doesn't move the container below, creates an overlap
                // padding moves everything below it as well
                /*
                 Rectangle()
                    .foregroundColor(.red)
                    .frame(width: 100, height: 100, alignment: .center)
                    .padding([.leading, .top], 20)
                    //.offset(x: 30, y: 30)
                */
            }
            
            GeometryReader { geo in
                Rectangle()
                    .foregroundColor(.green)
                    .frame(width: geo.size.width/4, height: geo.size.height/8, alignment: .center)
                    .onTapGesture {
                        print("Global - x: \(geo.frame(in: .global).minX), y: \(geo.frame(in: .global).minY)")
                        print("Local - x: \(geo.frame(in: .local).minX), y: \(geo.frame(in: .local).minY)")
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
