//
//  FontManager.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

/// Centralised typeface registry for the app's primary custom font family (BungeeLayers).
/// Add new weight or style cases here so every call-site references a single source of truth.
enum TypefaceOne {
    case regular

    /// Returns a SwiftUI `Font` for this typeface variant at the given point size.
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("BungeeLayers-Regular", size: size)
        }
    }
}
