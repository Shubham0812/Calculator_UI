//
//  FoundationExtensions.swift
//  Calculator_UI
//
//  Created by Shubham on 13/07/21.
//

import UIKit

extension Double {
    /// Formats the double as a clean string — returns a whole number when there is no fractional part,
    /// or a decimal string rounded to the given number of `places`.
    func clean(places: Int) -> String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.\(places)f", self)
    }
}
