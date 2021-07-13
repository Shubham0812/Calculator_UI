//
//  DisplayView.swift
//  Calculator_UI
//
//  Created by Shubham on 13/07/21.
//

import SwiftUI

struct DisplayView: View {
    
    // MARK:- variables
    @EnvironmentObject var appModel: AppModel
    
    let height: CGFloat
    let colorScheme: ColorScheme
    let duration: TimeInterval
    
    // MARK:- views
    var body: some View {
        ZStack {
            DisplayShape()
                .foregroundColor(Color(UIColor(named: "displayColor")!))
                .frame(height: height * 0.275)
    
            ZStack{
                VStack(spacing: 0) {
                    Spacer()
                    Rectangle()
                        .foregroundColor(colorScheme == .light ? Color.blue : Color(hex: "#683B94"))
                        .frame(height: 18)
                    Rectangle()
                        .foregroundColor(colorScheme == .light ? Color.orange : Color(hex: "#FA4656"))
                        .frame(height: 18)
                }
            }.frame(height: height * 0.275)
            

            DisplayShape()
                .stroke(style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round))
                .frame(height: height * 0.275)
                .foregroundColor(.label)
                .padding(.horizontal, 2.25)
            
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Text(appModel.input)
                        .foregroundColor(.label)
                        .font(self.appModel.valueComputed ? TypefaceOne.medium.font(size: 24) : TypefaceOne.bold.font(size: 64))
                        .tracking(4)
                        .lineLimit(1)
                        .opacity(self.appModel.valueComputed ?  0.6 : 1)
                        .offset(y: self.appModel.valueComputed ? -10 : 0)
                        .animation(.easeOut(duration: duration))
                    
                    Text(appModel.result.clean(places: 3))
                        .font(self.appModel.valueComputed ? TypefaceOne.bold.font(size: 64) : TypefaceOne.medium.font(size: 24))
                        .opacity(self.appModel.valueComputed ? 1 : 0)
                        .offset(y: self.appModel.valueComputed ? -15 : 0)
                        .animation(.spring())
                }
            }.padding(.trailing, 18)
        }
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView(height: 818, colorScheme: .dark, duration: 0.3)
            .environmentObject(AppModel())
    }
}
