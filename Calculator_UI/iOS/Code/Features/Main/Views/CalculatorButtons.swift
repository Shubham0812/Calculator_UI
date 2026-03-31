//
//  CalculatorButtons.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

/// Lays out the five-row calculator button grid (operations, digits, decimal, and equal)
/// using a series of `HStack` rows inside a `VStack`.
struct CalculatorButtons: View {
    
    // MARK: - Variables
    @EnvironmentObject var appModel: MainViewModel
    
    var stackSpacing: CGFloat = 0
    
    
    // MARK: - Views
    var body: some View {
        
        // We'll Define a VStack to align the rows vertically
        // We'll define the Rows using a HStack
        VStack(alignment: .leading, spacing: stackSpacing - 4) {
            Spacer()
            
            // HStack to contain 4 buttons per row
            // Pass Operations and color accordingly
            HStack(spacing: stackSpacing) {
                CalculatorPad(dialPad: .clear, color: .teal)
                CalculatorPad(dialPad: .plusMinus, color: .teal)
                CalculatorPad(dialPad: .percentage, color: .teal)
                CalculatorPad(dialPad: .divide, color: .orange)
            }
            
            HStack(spacing: stackSpacing) {
                CalculatorPad(dialPad: .seven)
                CalculatorPad(dialPad: .eight)
                CalculatorPad(dialPad: .nine)
                CalculatorPad(dialPad: .multiply, color: .orange)
            }
            
            HStack(spacing: stackSpacing) {
                CalculatorPad(dialPad: .four)
                CalculatorPad(dialPad: .five)
                CalculatorPad(dialPad: .six)
                CalculatorPad(dialPad: .substract, color: .orange)
            }
            
            HStack(spacing: stackSpacing) {
                CalculatorPad(dialPad: .one)
                CalculatorPad(dialPad: .two)
                CalculatorPad(dialPad: .three)
                CalculatorPad(dialPad: .plus, color: .orange)
            }
            
            HStack(spacing: stackSpacing) {
                CalculatorPad(dialPad: .zero)
                
                // Need to define one more HStack so that the outer HStack divides the available space into two parts
                HStack(spacing: stackSpacing) {
                    CalculatorPad(dialPad: .decimal)
                    CalculatorPad(dialPad: .equal, color: .orange)
                }
            }
        }
        .environmentObject(appModel)
    }
}

struct CalculatorButtons_Previews: PreviewProvider {
    static var previews: some View {
        
        CalculatorButtons(stackSpacing: 24)
        // set the frame and padding for a better understanding
            .frame(height: 450)
            .padding(24)
            .environmentObject(MainViewModel())
    }
}
