//
//  DisplayShape.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI


// Custom Shape to Render the Display Shape
struct DisplayShape: Shape {
    
    // MARK: - functions
    
    // Path function is defined in the Shape Protocol
    // It's mandatory to implement this function
    func path(in rect: CGRect) -> Path {
        
        // Center X & Center Y Points to enable us to draw the Paths
        let cX: CGFloat = rect.midX
        let cY: CGFloat = rect.midY
        
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: cY * 2))
        path.addLine(to: CGPoint(x: cX * 2, y: 0))
        path.addLine(to: CGPoint(x: cX / 2 - 40, y: 0))
        
        path.addLine(to: CGPoint(x: 0, y: cY - 62))
        
        // closes the Path & makes it a full shape
        path.closeSubpath()
        
        return path
    }
}

struct DisplayShape_Previews: PreviewProvider {
    static var previews: some View {
        DisplayShape()
            .stroke(lineWidth: 2)
            .padding(4)
            .frame(height: 240)
    }
}
