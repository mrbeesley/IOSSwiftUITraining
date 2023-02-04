//
//  ContentView.swift
//  MvvmDemo
//
//  Created by Michael Beesley on 12/28/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = RecipeModel()    
    
    var body: some View {
        VStack {
            List(model.recipes) { r in
                VStack(alignment: .leading) {
                    Text(r.name)
                        .font(.title)
                    Text(r.cuisine)
                        .font(.body)
                }
            }
            Button("Add Recipe") {
                model.addRecipe()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
