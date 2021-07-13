//
//  Colors.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

extension Color {
    
    static let background: Color = Color(UIColor.systemBackground)
    static let label: Color = Color(UIColor.label)
    
    
    // MARK:- functions
    static func getBackgroundColor(colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .dark:
            return Color(hex: "#303444")
        case .light:
            return Color(hex: "#EFE5CF")
            
        default:
            return .white
        }
    }
    
    static func getColorForCells(colorScheme: ColorScheme) -> Color {
        switch colorScheme {
        case .dark:
            return Color(hex: "#4D5672")
        default:
            return Color.black
        }
    }
}

