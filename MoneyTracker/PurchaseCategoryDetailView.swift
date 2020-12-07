//
//  PurchaseCategoryDetailView.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-30.
//

import SwiftUI

struct PurchaseCategoryDetailView: View {
    

    // Whether we are showing the add purchase view or not
    @State private var addingPurchase = false
    
    @ObservedObject var category: PurchaseCategory
    
    @State private var totalCategoryAmount = 0.0
    
    var body: some View {
        
        VStack {
            
            // List purchases
            if category.purchases.count > 0 {
                
                List(category.purchases) { purchase in
                    
                    HStack() {
                        VStack {
                            Text(purchase.description)
                            Text("\(purchase.date)")
                        }
                        Spacer()
                        
                        Text(String(format: "%.02f", purchase.amount))

                    }
                }
                
                Spacer()

                Text("The total amount you have spent in this category is $\(category.totalOfAllPurchases, specifier: "%.2f")")

                Spacer()
                
                
            } else {
                
                Text("No purchases have been made yet in this category.")
                    .padding()
                
            }
            
            Spacer()
            
        }
        .navigationTitle(category.title)
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {

                Button(action: {
                    print("Here's where we would add a purchase")
                    addingPurchase = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
        }
        .sheet(isPresented: $addingPurchase) {
            AddPurchase(category: category, addingPurchase: $addingPurchase)
        }
        
        
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
                                                                  totalOfAllPurchases: 231.95,
                                                                  purchases: [
                                                                    Purchase(amount: 137.53,
                                                                             description: "TTC Pass",
                                                                             date: Date()),
                                                                    Purchase(amount: 24.17,
                                                                             description: "Taxi Fare to Peterborough",
                                                                             date: Date()),
                                                                    Purchase(amount: 70.25,
                                                                             description: "Bus ticket to Toronto",
                                                                             date: Date()),
                                                                  ])
            )

        }
    }
}
