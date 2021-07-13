//
//  MainView.swift
//  Calculator_UI
//
//  Created by Shubham on 12/07/21.
//

import SwiftUI

struct MainView: View {
    
    // MARK:- variables
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject var appModel: AppModel = AppModel()
    
    let duration: TimeInterval = 0.3
    
    // MARK:- views
    var body: some View {
        GeometryReader { proxy in
            
            let width: CGFloat = proxy.size.width - 48
            let height: CGFloat = proxy.size.height
            
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                Color.getBackgroundColor(colorScheme: colorScheme)
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading, spacing: 28) {
                    HStack {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CASIO")
                                .font(.custom("EurostileExtended-Black", size: 26))
                            
                            Text("Calculator")
                                .font(TypefaceTwo.medium.font(size: 14))
                                .textCase(.uppercase)
                                .opacity(0.4)
                                .offset(x: 2)
                        }
                        Spacer()
                        HStack(spacing: 2) {
                            ForEach(0 ..< 4) { _ in
                                Rectangle()
                                    .foregroundColor(Color.getColorForCells(colorScheme: colorScheme))
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    
                    DisplayView(height: height, colorScheme: colorScheme, duration: duration)
                        .environmentObject(appModel)
                        .padding(.horizontal, -18)
                    
                    CalculatorButtons(width: width)
                        .environmentObject(appModel)
                }.padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
//            .colorScheme(.dark)
    }
}
