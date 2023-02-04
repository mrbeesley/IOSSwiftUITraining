//
//  RectangleCardView.swift
//  LearningApp
//
//  Created by Michael Beesley on 1/19/23.
//

import SwiftUI

struct RectangleCardView: View {
    
    var backColor = Color.white
    var foreColor = Color.black
    var text = "Enter Text"
    var height = 48.0
    
    var body: some View {
        
        
        ZStack {
            Rectangle()
                .frame(height: height)
                .foregroundColor(backColor)
                .cornerRadius(10)
                .shadow(radius: 5)
            
            Text(text)
                .foregroundColor(foreColor)
                .bold()
        }
    }
}

struct RectangleCardView_Previews: PreviewProvider {
    static var previews: some View {
        RectangleCardView()
    }
}
