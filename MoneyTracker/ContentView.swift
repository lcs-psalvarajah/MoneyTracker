//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-09.
//

import SwiftUI

struct ContentView: View {
    
    // Property to track purchase categories
    @StateObject private var purchaseCategories = PurchaseCategories()
    
    // Whether we are showing the add activity view or not
    @State private var addingCategory = false
    
    // to track what the budget amount is for the graphs to based on
    @State private var totalBudget = ""
    
    //Body property defines the user interface
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Monthly Budget")) {
                    TextField("Budget Amount", text: $totalBudget)
                }
                
                Section(header: Text("Graph")) {
                                VStack(alignment: .trailing, spacing: 10) {
                    
                                    ForEach(purchaseCategories.defined) { category in
                    
                                        BarView(valueToIllustrate: CGFloat(category.totalOfAllPurchases),
                                                cornerRadius: 10.0,
                                                animationSpeed: 2.0,
                                                label: category.title)
                    
                                    }
                    
                                }
                                .padding(.top, 24)
                }
                
                Section {
                    
                    List(purchaseCategories.defined) { currentCategory in
                        
                        NavigationLink(currentCategory.title,
                                       destination: PurchaseCategoryDetailView(category: currentCategory))
                        
                        
                        
                    }
                }
            }
            .navigationTitle("Money Tracker")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                    
                    Button(action: {
                        print("Here's where we would add a category")
                        addingCategory = true
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
            .sheet(isPresented: $addingCategory) {
                AddPurchaseCategory(purchaseCategories: purchaseCategories,
                                    addingCategory: $addingCategory)
            }
            

            
            
        }
        
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
