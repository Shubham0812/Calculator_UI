//
//  AppModel.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

class MainViewModel: ObservableObject {
    
    // MARK: - Variables
    
    @Published var result = ""
    @Published var resultReady = false
    
    let mathOperations = "+-*/%"
    var currentOperation: Operation = .unknown
    
    let maxCalculatorLimit = 10
    
    
    // MARK: - Functions
    
    // calculates the value of the inputs
    func calculate() {
        // if the input contains an incomplete expression, then don't evaluate it.
        guard (!mathOperations.contains(result.suffix(1)))  else { return }
        let exp: NSExpression = NSExpression(format: result)
        guard let computedValue: Double = exp.expressionValue(with:nil, context: nil) as? Double else { return }
        
        // assign the computed value as a string
        self.result = computedValue.clean(places: 3)
        
        // reset the current operation
        self.currentOperation = .unknown
        
        // publish to views that the result has been computed
        self.resultReady = true
    }
    
    func set(operation: Operation) {
        switch operation {
        case .percentage:
            // convert string to Double
            // add percentage
            guard let input = Double(result) else { return }
            
            self.result = (input * 0.01).clean(places: 3)
            self.currentOperation = .unknown
            
            // convert string to Double
            // add +- sign to the input
        case .plusMinus:
            guard let input = Double(result) else { return }
            
            self.result = (-input).clean(places: 3)
            self.currentOperation = .unknown
            
        default:
            break
        }
    }
    
    
    func addOperation(operation: Operation) {
        // check if the last input is an operation
        // If it is, then replace the operation
        if (currentOperation != .unknown) {
            if mathOperations.contains(result.suffix(1)) {
                // replace the last operation with the new operation
                self.result.removeLast()
                
                // update the current operation and return
                result += operation.rawValue
                self.currentOperation = operation
                return
            }
            calculate()
        }
        
        // add the current operation to the input if current operation is unknown
        // we do not want to have multiple operations
        result += operation.rawValue
        self.currentOperation = operation
    }
    
    
    // MARK: - Functions
    
    // Function is called from the Calculator Pad View.
    // Performs the action for various Calculator Buttons
    func performAction(for pad: DialPad) {
        switch pad {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine:
            
            // To restrict the user from adding digits to the computation without selecting an operation
            // If this line is removed then you can directly add digits to the computed result.
            // 55 + 5 = 60 ( Without the guard code, you can add any digit to the result & make it 605 for example.
            guard (!resultReady || currentOperation != .unknown) else { return }
            
            // Set maximum calculator number input limit
            guard result.count <= maxCalculatorLimit else { return }
            
            self.result += pad.rawValue
            
        case .clear:
            reset()
            
        case .plusMinus:
            self.set(operation: .plusMinus)
            
        case .percentage:
            self.set(operation: .percentage)
            
        case .divide:
            self.addOperation(operation: .divide)
            
        case .multiply:
            self.addOperation(operation: .multiply)
            
        case .substract:
            self.addOperation(operation: .minus)
            
        case .plus:
            self.addOperation(operation: .plus)
            
        case .decimal:
            // to avoid adding multiple decimals to a number
            guard (currentOperation != .unknown || !result.contains(pad.rawValue))  else { return }
            self.result += pad.rawValue
            
        case .revert:
            self.reset()
            
        case .equal:
            self.calculate()
        }
    }
    
    // reset the variables & start anew.
    func reset() {
        self.result = ""
        self.currentOperation = .unknown
        self.resultReady = false
    }
}
