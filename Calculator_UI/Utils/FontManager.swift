//
//  FontManager.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

/// I like to keep fonts in a single place so that it's easier to apply them to the Font modifier in the project.
enum TypefaceOne {
    case regular
    case medium
    case semibold
    case bold
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .system(size: size, weight: .regular)
        case .medium:
            return .system(size: size, weight: .medium)
        case .semibold:
            return .system(size: size, weight: .semibold)
        case .bold:
            return .system(size: size, weight: .bold)

        }
    }
}


enum TypefaceTwo {
    case regular
    case medium
    case semibold
    case bold
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("Ubuntu-Regular", size: size)
        case .medium:
            return .custom("Ubuntu-Medium", size: size)
        case .semibold:
            return .custom("Ubuntu-SemiBold", size: size)
        case .bold:
            return .custom("Ubuntu-Bold", size: size)
            
        }
    }
}
