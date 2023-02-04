//
//  DashedDividerView.swift
//  CitySightsApp
//
//  Created by Michael Beesley on 2/4/23.
//

import SwiftUI

struct DashedDividerView: View {
    var body: some View {
        
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint.zero)
                path.addLine(to: CGPoint(x: geometry.size.width, y: 0))
            }
            .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
        }
        .frame(height: 1)
        
    }
}

struct DashedDividerView_Previews: PreviewProvider {
    static var previews: some View {
        DashedDividerView()
    }
}
