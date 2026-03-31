//
//  Colors.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI


/// Convenience accessors for system-adaptive colors, bridging UIKit system colors into SwiftUI.
extension Color {
    /// The system background color, adapting automatically to light and dark mode.
    static let background: Color = Color(UIColor.systemBackground)
    /// The primary label color, adapting automatically to light and dark mode.
    static let label: Color = Color(UIColor.label)
}

