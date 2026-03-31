//
//  CalculatorPad.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

/// A single calculator button. Displays its `DialPad` label over a rounded rectangle
/// and animates a press-scale effect on tap, forwarding the action to the view-model.
struct CalculatorPad: View {
    
    // MARK: - Variables
    @EnvironmentObject var appModel: MainViewModel
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    // to emulate the press of the button, we'll change scale's value on button tap
    @State var scale: CGFloat = 1
    @State var foregroundColor = Color.white

    let animationDuration: TimeInterval = 0.15
    
    var dialPad: DialPad
    var color: Color = .label
    
    
    // MARK: - views
    var body: some View {
        
        // We'll use RoundedRectangle as the base of our Calculator Pad
        // We can add views on top of it using the Overlay Modifier
        RoundedRectangle(cornerRadius: 12)
            // to provide a custom color to the operation than the regular numbers
            .foregroundColor(appModel.currentOperation.rawValue == dialPad.getOperator() && appModel.currentOperation != .unknown ? color.opacity(0.2) : .blue.opacity(0.035))
            .overlay(
                Text(dialPad.rawValue)
                    .font(TypefaceOne.regular.font(size: 30))
                    .foregroundColor(color)
            )
            .scaleEffect(scale)
            .onTapGesture {
                
                // call the functionality needed with the help of function defined in the ViewModel
                // passing dial pad allows the ViewModel to understand what action is needed
                self.appModel.performAction(for: dialPad)
                
                // reduce the scale of the View
                withAnimation(.easeInOut(duration: animationDuration)) {
                    scale = 0.95
                }
                
                // restores the scale after the animation duration delay
                Timer.scheduledTimer(withTimeInterval: animationDuration, repeats: false) { _ in
                    withAnimation(.default) {
                        // can revert color of needed
                        scale = 1
                    }
                }
            }
    }
}

struct CalculatorPad_Previews: PreviewProvider {
    static var previews: some View {
        // pass any Calculator Pad value here to test
        CalculatorPad(dialPad: .one)
            .environmentObject(MainViewModel())
            .frame(width: 70, height: 70)
        
    }
}
