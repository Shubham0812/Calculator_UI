//
//  CalculatorButtons.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

struct CalculatorButtons: View {
    
    // MARK:- variables
    @EnvironmentObject var appModel: AppModel
    let width: CGFloat
    
    // MARK:- views
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Spacer()
            
            HStack() {
                CalculatorPad(type: .primary, number: "C") {
                    appModel.clearSingleEntry()

                }.gesture(
                    LongPressGesture(minimumDuration: 4, maximumDistance: 0)
                        .onChanged({ _ in
                            appModel.reset()
                        })
                )
                
                CalculatorPad(number: "±") {
                    self.appModel.set(operation: .plusMinus)
                }
                
                CalculatorPad(number: "%") {
                    self.appModel.set(operation: .percentage)
                }
                CalculatorPad(number: "/") {
                    self.appModel.addOperation(operation: .divide)
                }
            }
            
            HStack {
                CalculatorPad(number: "7") {
                    self.appModel.input += "7"
                }
                
                CalculatorPad(number: "8") {
                    self.appModel.input += "8"
                }
                
                CalculatorPad(number: "9") {
                    self.appModel.input += "9"
                }
                
                CalculatorPad(number: "*") {
                    self.appModel.addOperation(operation: .multiply)
                }
            }
            
            HStack {
                CalculatorPad(number: "4") {
                    self.appModel.input += "4"
                }
                CalculatorPad(number: "5") {
                    self.appModel.input += "5"
                }
                
                CalculatorPad(number: "6") {
                    self.appModel.input += "6"
                }
                CalculatorPad(number: "-") {
                    self.appModel.addOperation(operation: .minus)
                }
            }
            
            HStack {
                CalculatorPad(number: "1") {
                    self.appModel.input += "1"
                }
                CalculatorPad(number: "2") {
                    self.appModel.input += "2"
                }
                
                CalculatorPad(number: "3") {
                    self.appModel.input += "3"
                }
                CalculatorPad(number: "+") {
                    self.appModel.addOperation(operation: .plus)
                }
            }
            HStack {
                CalculatorPad( number: "0") {
                    appModel.addZero()
                }.frame(width: width / 2 - 4)
                
                CalculatorPad(number: ".") {
                    
                }
                
                CalculatorPad(number: "=") {
                    appModel.calculate()
                }
            }
        }.environmentObject(appModel)
    }
}

struct CalculatorButtons_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtons(width: 428)
            .frame(height: 450)
            .padding(24)
            .environmentObject(AppModel())
    }
}
