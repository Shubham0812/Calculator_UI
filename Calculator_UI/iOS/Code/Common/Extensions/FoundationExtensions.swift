//
//  FoundationExtensions.swift
//  Calculator_UI
//
//  Created by Shubham on 13/07/21.
//

import UIKit

// Allows us to convert Decimal to String, and apply Floating Point Precisions
extension Double {
    func clean(places: Int) -> String {
        if self.truncatingRemainder(dividingBy: 1) == 0 {
            return String(format: "%.0f", self)
        }
        var formatted = String(format: "%.\(places)f", self)
        while formatted.hasSuffix("0") {
            formatted.removeLast()
        }
        if formatted.hasSuffix(".") {
            formatted.removeLast()
        }
        return formatted
    }
}
