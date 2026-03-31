//
//  DisplayView.swift
//  Calculator_UI
//
//  Created by Shubham on 13/07/21.
//

import SwiftUI

/// The calculator's display area showing the current input or result.
/// Renders the custom `DisplayShape` background with decorative accent bars and a text overlay.
struct DisplayView: View {
    
    // MARK: - variables
    @EnvironmentObject var mainViewModel: MainViewModel
    
    let height: CGFloat
    let colorScheme: ColorScheme
    let duration: TimeInterval
    
    // MARK: - views
    var body: some View {
        ZStack {
            // ZStack to contain the display shape
            ZStack {
                // The color within the Display shape
                DisplayShape()
                    .foregroundColor(.indigo)
                    .opacity(0.05)
                // VStack to contain the bottom two lines
                VStack(spacing: 0) {
                    Spacer()
                    Rectangle()
                        .foregroundColor(.cyan)
                        .frame(height: 18)
                        .opacity(0.3)
                    Rectangle()
                        .foregroundColor(.orange)
                        .frame(height: 18)
                        .opacity(0.3)
                }
                // One more Display Shape to add the border along the Display path
                // We'll use the stroke modifier to convert the Fill into a path
                DisplayShape()
                    .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.label)
                    .padding(.horizontal, 2.25)
            }
            .frame(height: height * 0.25)
            // We'll add the Numbers and Result inside the overlay modifier
            // Need trailing so that the numbers start from the right side
            .overlay(alignment: .trailing) {
                ZStack {

                    // Default Placeholder to show where the input starts from to the user
                    // It's a good practice to build user habit and set their expectations from the app
                    displayStyledText("0")
                        .opacity(self.mainViewModel.result.isEmpty ? 0.6 : 0)
                        .animation(.default, value: self.mainViewModel.result.isEmpty)

                    // The Input / Result Text View
                    displayStyledText(mainViewModel.result)
                        .minimumScaleFactor(0.6)
                        .animation(.default, value: self.mainViewModel.result.isEmpty)
                }
                    
                    // Default Placeholder to show where the input starts from to the user
                    // It's a good practice to build user habit and set their expectations from the app
                    Text("0")
                        .foregroundColor(.label)
                        .font(TypefaceOne.regular.font(size: 62))
                        .tracking(4)
                        .lineLimit(1)
                        .animation(.easeInOut(duration: duration), value: self.mainViewModel.result)
                        .opacity(self.mainViewModel.result.isEmpty ? 0.6 : 0)
                        .animation(.default, value: self.mainViewModel.result.isEmpty)
                    
                    // The Input / Result Text View
                    Text(mainViewModel.result)
                        .foregroundColor(.label)
                        .font(TypefaceOne.regular.font(size: 62))
                        .tracking(4)
                        .minimumScaleFactor(0.6)
                        .lineLimit(1)
                    
                    // starting from iOS 15, you need to pass variable(s) in the value parameter
                        .animation(.easeInOut(duration: duration), value: mainViewModel.result)
                        .animation(.default, value: self.mainViewModel.result.isEmpty)
                }
                
                // padding modifier to give spacing to the number
                .padding(.horizontal, 24)
            }
        }

/// Returns a `Text` view with the shared display font, tracking, color, line limit, and result animation.
    private func displayStyledText(_ value: String) -> some View {
        Text(value)
            .foregroundColor(.label)
            .font(TypefaceOne.regular.font(size: 62))
            .tracking(4)
            .lineLimit(1)
            .animation(.easeInOut(duration: duration), value: mainViewModel.result)
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(height: 818, colorScheme: .dark, duration: 0.3)
            .environmentObject(MainViewModel())
            .padding(2)
    }
}
