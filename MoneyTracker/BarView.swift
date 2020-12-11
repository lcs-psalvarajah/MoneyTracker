//
//  BarView.swift
//  BarChartsExample
//
//  Created by Russell Gordon on 2020-12-04.
//

// NOTE: Adapted from https://medium.com/better-programming/swiftui-bar-charts-274e9fbc8030


import SwiftUI

struct BarView: View {
    
    // Category to illustrate
    var category: PurchaseCategory

    // What's the overall budget?
    var budget: CGFloat

    // Starting value
    @State private var currentValue: CGFloat = 0.0
    
    // How rounded the corner of the bar should be (higher is more rounded)
    var cornerRadius: CGFloat = 10.0
    
    // Control speed of animation
    var animationSpeed = 2.0
    
    
    // How wide to make the bar
    var barWidth: CGFloat {
        return 200.0 * (CGFloat(category.totalOfAllPurchases) / budget)
        
    }
    
    
    var body: some View {
        
        HStack(alignment: .center) {

            Text(category.title)
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
                currentValue = barWidth
            }

        }
        
        
    }
}

struct BarView_Previews: PreviewProvider {
    static var previews: some View {
    
        BarView(category: PurchaseCategory(title: "Food",
                                                  description: "Things that I need to consume to do everything else in my life...",
                                                  totalOfAllPurchases: 57.28,
                                                  purchases: [
                                                   Purchase(amount: 25.00, description: "Milk", date: Date()),
                                                   Purchase(amount: 32.00, description: "Cereal", date: Date()),
                                                   Purchase(amount: 0.27, description: "Sugar", date: Date()),
                                                  ]),
                       budget: 200)
    }
}
