//
//  Operation.swift
//  Calculator_UI
//
//  Created by Shubham Singh on 22/08/23.
//

/// Arithmetic and special operations supported by the calculator.
/// The `rawValue` is the math symbol appended to the expression string.
enum Operation: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    case plusMinus = "±"
    case percentage = "%"
    case unknown = ""
}
