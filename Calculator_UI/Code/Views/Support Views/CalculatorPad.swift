//
//  CalculatorPad.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

enum Type {
    case primary
    case normal
    
    func getColorForBackground() -> Color {
        switch self {
        case .primary:
            return  Color(UIColor(named: "primary")!)
        case .normal:
            return Color(UIColor(named: "normal")!)
        }
    }
    
    
    func getColorForForeground() -> Color {
        switch self {
        case .primary:
            return Color(UIColor(named: "primaryButton")!)
        case .normal:
            return Color(UIColor(named: "normalButton")!)
        }
    }
}

struct CalculatorPad: View {
    
    // MARK:- variables
    @State var scale: CGFloat = 1
    @State var foregroundColor = Color.white
    @EnvironmentObject var appModel: AppModel
    
    var type: Type = .normal
    var number = ""
    var action: () -> () = {}
    
    
    
    // MARK:- views
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(self.appModel.currentOperation.rawValue == number ? Type.primary.getColorForBackground().opacity(0.6) : foregroundColor)
            .overlay(
                Text(number)
                    .font(TypefaceOne.bold.font(size: 34))
                    .foregroundColor(type.getColorForForeground())
            )
            
            .scaleEffect(scale)
            .onAppear() {
                self.foregroundColor = type.getColorForBackground()
            }
            .onTapGesture {
                action()
                withAnimation(.easeIn(duration: 0.15)) {
                    scale = 1.1
                }
                withAnimation(.default) {
                    self.foregroundColor = Type.primary.getColorForBackground().opacity(0.2)
                }
                Timer.scheduledTimer(withTimeInterval: 0.15, repeats: false) { _ in
                    withAnimation(.default) {
                        scale = 1
                        self.foregroundColor = type.getColorForBackground()
                    }
                }
            }
        
    }
}

struct CalculatorPad_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorPad(number: "0")
            .environmentObject(AppModel())
            .frame(width: 100, height: 70)
    }
}
