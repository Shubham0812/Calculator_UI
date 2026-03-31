//
//  DialPad.swift
//  Calculator_UI
//
//  Created by Shubham Singh on 23/08/23.
//

import Foundation

/// Represents every button on the calculator dial pad.
/// Each case's `rawValue` is the display label shown on the button.
enum DialPad: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case clear = "AC"
    case plusMinus = "+/-"
    case percentage = "%"
    case divide = "÷"
    case multiply = "x"
    case substract = "-"
    case plus = "+"
    case decimal = "."
    case revert = "⌀"
    case equal = "="
    
    /// Maps an arithmetic dial-pad button to the math operator string used by `NSExpression`.
    /// Returns an empty string for non-operator buttons.
    func getOperator() -> String {
        switch self {
        case .plus:
            return "+"
        
        case .substract:
            return "-"
            
        case .multiply:
            return "*"
            
        case .divide:
            return "/"
            
        default:
            return ""
        }
    }
}
