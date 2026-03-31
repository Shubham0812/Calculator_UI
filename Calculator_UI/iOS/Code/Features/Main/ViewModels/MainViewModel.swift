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
        // don't evaluate empty expressions
        guard !result.isEmpty else { return }

        // if the input contains an incomplete expression, then don't evaluate it.
        guard (!mathOperations.contains(result.suffix(1)))  else { return }

        // Handle modulo separately since NSExpression doesn't support %
        if result.contains("%") {
            let parts = result.components(separatedBy: "%")
            guard parts.count == 2,
                  let left = Double(parts[0]),
                  let right = Double(parts[1]),
                  right != 0 else { return }

            self.result = left.truncatingRemainder(dividingBy: right).clean(places: 3)
            self.currentOperation = .unknown
            self.resultReady = true
            return
        }

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
        // don't allow operators on empty input (except minus for negative numbers)
        guard !result.isEmpty || operation == .minus else { return }

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
            self.resultReady = false

        case .clear:
            reset()

        case .plusMinus:
            self.set(operation: .plusMinus)

        case .percentage:
            self.addOperation(operation: .modulo)

        case .divide:
            self.addOperation(operation: .divide)

        case .multiply:
            self.addOperation(operation: .multiply)

        case .substract:
            self.addOperation(operation: .minus)

        case .plus:
            self.addOperation(operation: .plus)

        case .decimal:
            // after a result with no pending operation, start a fresh number
            if resultReady && currentOperation == .unknown {
                self.result = "0"
                self.resultReady = false
            }

            // check the current number segment (after last operator) for an existing decimal
            let currentNumber = result.split(whereSeparator: { "+-*/%".contains($0) }).last.map(String.init) ?? result
            guard !currentNumber.contains(".") else { return }
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
