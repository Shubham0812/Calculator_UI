//
//  AppModel.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

enum Operation: String {
    case plus = "+"
    case minus = "-"
    case multiply = "*"
    case divide = "/"
    case plusMinus = "±"
    case percentage = "%"
    case unknown = ""
}

class AppModel: ObservableObject {
    
    // MARK:- variables
    let mathOperations = "+-*/%"
    var currentOperation: Operation = .unknown
    
    @Published var input = "0" {
        didSet {
            if input.isEmpty {
                self.input = "0"
                self.valueComputed = false
            } else if (input.starts(with: "0") && self.input.count > 1) {
                self.input.removeFirst()
            }
        }
    }
    
    @Published var result: Double = 0
    
    @Published var clearValues = false
    @Published var valueComputed = false
    
    
    // MARK:- functions
    func addZero() {
        if (self.input.count != 1) {
            self.input += "0"
        }
    }
    
    func clearSingleEntry() {
        let removedEntry = self.input.removeLast()
        if (mathOperations.contains(removedEntry)) {
            self.currentOperation = .unknown
        }
    }
    
    func calculate() {
        if (!mathOperations.contains(input[input.count - 1])) {
            
            let exp: NSExpression = NSExpression(format: input)
            guard let computedValue: Double = exp.expressionValue(with:nil, context: nil) as? Double else { return }
                        
            self.result = computedValue
            self.currentOperation = .unknown
            self.valueComputed = true
        }
    }
    
    func set(operation: Operation) {
        switch operation {
        case .percentage:
            result = (Double(input) ?? result) * 0.01
            self.valueComputed = true
            self.currentOperation = .unknown
        case .plusMinus:
            result = -result
            self.valueComputed = true
            self.currentOperation = .unknown
        default:
            break
        }
    }
    
    func addOperation(operation: Operation) {
        if (currentOperation != .unknown) {
            if (mathOperations.contains(input[input.count - 1])) {
                
                // replace the last operation with the new operation
                self.input.removeLast()
                
                // update the current operation and return
                input += operation.rawValue
                self.currentOperation = operation
                return
            }
            
            /// perform calculation
            calculate()
        }
        
        /// if the current operation is unknown add to the input
        input += operation.rawValue
        self.currentOperation = operation
    }
    
    func reset() {
        self.input = "0"
        self.result = 0
        self.currentOperation = .unknown
        self.valueComputed = false
    }
}
