//
//  FontManager.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

// I like to keep fonts in a single place so that it's easier to apply them to the Font modifier in the project.
enum TypefaceOne {
    case regular
    
    func font(size: CGFloat) -> Font {
        switch self {
        case .regular:
            return .custom("BungeeLayers-Regular", size: size)
        }
    }
}
