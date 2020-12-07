//
//  BarView.swift
//  BarChartsExample
//
//  Created by Russell Gordon on 2020-12-04.
//

// NOTE: Adapted from https://medium.com/better-programming/swiftui-bar-charts-274e9fbc8030


import SwiftUI

struct BarView: View {

    // Starting value
    @State private var currentValue: CGFloat = 0.0
    
    // The value to be illustrated with a bar
    var valueToIllustrate: CGFloat
    
    // How rounded the corner of the bar should be (higher is more rounded)
    var cornerRadius: CGFloat
    
    // Control speed of animation
    var animationSpeed = 2.0
    
    // The label for the value
    var label = ""
    
    var body: some View {
        
        HStack(alignment: .center) {

            Text(label)
                .padding(.bottom, 10)

            ZStack (alignment: .leading) {
        
                // Background, fixed length of 200 points
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: 200, height: 30)
                    .foregroundColor(.black)
                
                // The length of the bar, based upon the value to illustrate
                RoundedRectangle(cornerRadius: cornerRadius)
                    .frame(width: currentValue, height: 30)
                    .foregroundColor(.green)
                    .animation(.easeIn(duration: animationSpeed))
                
            }
            .padding(.bottom, 8)
            .onAppear() {
                currentValue = valueToIllustrate
            }

        }
        
        
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
    
        BarView(valueToIllustrate: 100, cornerRadius: 10, animationSpeed: 2.0, label: "Recreation")
        
    }
}
