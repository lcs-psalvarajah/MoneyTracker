//
//  PurchaseCategoryDetailView.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-30.
//

import SwiftUI

struct PurchaseCategoryDetailView: View {

    @ObservedObject var category: PurchaseCategory
    
    var body: some View {
        
        VStack {
            
            // List purchases
            if category.purchases.count > 0 {
                
                List(category.purchases) { purchase in
                    
                    HStack() {
                        Text(purchase.description)
                        Spacer()
                        Text(purchase.amount)
                    }
                    
                    
                }
                
            } else {
                
                Text("No purchases have been made yet in this category.")
                    .padding()
                
            }
            
            Spacer()
            
        }
        .navigationTitle(category.title)
        
    }
}


struct PurchaseCategoryDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        NavigationView {
            
            PurchaseCategoryDetailView(category: PurchaseCategory(title: "Food",
                                                                  description: "Meals, snacks, and so on."))

        }
        
        NavigationView {
            
            PurchaseCategoryDetailView(category: PurchaseCategory(title: "Transportation",
                                                                  description: "For getting to and fro.",
                                                                  purchases: [
                                                                    Purchase(amount: "137.53",
                                                                             description: "TTC Pass",
                                                                             date: Date()),
                                                                    Purchase(amount: "24.17",
                                                                             description: "Taxi Fare to Peterborough",
                                                                             date: Date()),
                                                                    Purchase(amount: "70.25",
                                                                             description: "Bus ticket to Toronto",
                                                                             date: Date()),
                                                                  ])
            )

        }
    }
}
