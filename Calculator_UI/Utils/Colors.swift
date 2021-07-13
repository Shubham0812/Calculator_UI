//
//  Colors.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

/// there are a couple of ways in which you can define colors in a SwiftUI app
/// I've used a function, that returns the color based on the ColorScheme Environment Property
/// I've also used direct properties in some places, it's okay to do it if they are specific to a view, it's it's getting used in multiple places, then please create a common entry :D
/// I've also created Color assets in the xcAssets file and used them in the project

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

