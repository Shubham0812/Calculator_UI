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
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.\(places)f", self)
    }
}
