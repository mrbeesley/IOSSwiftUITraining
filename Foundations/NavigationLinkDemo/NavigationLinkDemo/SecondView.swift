//
//  SecondView.swift
//  NavigationLinkDemo
//
//  Created by Michael Beesley on 1/19/23.
//

import SwiftUI

struct SecondView: View {
    
    @Binding var selectedIndex: Int?
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Navigate Back", action: {
                selectedIndex = nil
            })
        }
    }
}

/*
struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
*/
