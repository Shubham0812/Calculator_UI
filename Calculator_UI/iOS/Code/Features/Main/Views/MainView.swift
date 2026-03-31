//
//  MainView.swift
//  Calculator_UI
//
//  Created by Shubham on 31/03/26.
/// CONTENT by @SHUBHAM_IOSDEV

import SwiftUI

/// Root view of the calculator app. Composes the CASIO header, display, and button grid
/// inside a responsive `GeometryReader` layout with dark/light mode support.
struct MainView: View {
    
    // MARK: - variables
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @StateObject var appModel: MainViewModel = MainViewModel()
    
    let duration: TimeInterval = 0.3
    
    
    // MARK: - views
    var body: some View {
        
        // Geometry reader to get access to the Width & Height of the whole Container View
        GeometryReader { proxy in
            
            // define a variable for Height
            let height: CGFloat = proxy.size.height
            
            // ZStack to contain all the Views
            ZStack(alignment: Alignment(horizontal: .leading, vertical: .top)) {
                
                // Background Color for the App
                // Use Edges ignoring Modifier to span it edge-to-edge
                Color.background
                    .edgesIgnoringSafeArea(.all)
                
                // VStack to render the Content Vertically
                VStack(alignment: .leading, spacing: 28) {
                    
                    HStack {
                        // VStack to show the Casio & Calculator Texts Vertically
                        VStack(alignment: .leading, spacing: 4) {
                            Text("CASIO")
                                .font(.custom("EurostileExtended-Black", size: 26))
                            
                            Text("Calculator")
                                .tracking(1.2)
                                .font(.system(size: 20, weight: .medium, design: .monospaced))
                                .textCase(.uppercase)
                                .opacity(0.25)
                                .offset(x: 2)
                        }
                        
                        // Since spacer is in the Middle. It'll push the first view to the left and the second to the right
                        Spacer()
                        
                        
                        // To Display the Four Cells
                        HStack(spacing: 4) {
                            
                            // Iterate 4 Times & Render a Rectangle
                            ForEach(0 ..< 4) { _ in
                                Rectangle()
                                    .foregroundColor(.gray)
                                    .frame(width: 20, height: 20)
                            }
                        }
                    }
                    
                    // To Render the Display View
                    DisplayView(height: height, colorScheme: colorScheme, duration: duration)
                        .environmentObject(appModel)
                        .padding(.horizontal, -18)
                    
                    // To Render the Calculator Buttons
                    CalculatorButtons(stackSpacing: 20)
                        .environmentObject(appModel)
                }
                // Padding to make the UI Look Less Cluttered
                .padding(.horizontal, 24)
                .padding(.vertical, 12)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
