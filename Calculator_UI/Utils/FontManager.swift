//
//  FontManager.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

enum TypefaceOne {
    case regular
    case medium
    case semibold
    case bold
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("Degular-Regular", size: size)
        case .medium:
            return .custom("Degular-Medium", size: size)
        case .semibold:
            return .custom("Degular-SemiBold", size: size)
        case .bold:
            return .custom("Degular-Bold", size: size)
            
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
