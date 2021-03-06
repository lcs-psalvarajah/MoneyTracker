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
    @State private var totalBudgetAsString = ""
    
    // property t make the budget into a double
    var totalBudget: Double {
        return Double(totalBudgetAsString) ?? 0.0
    }
    
    //Body property defines the user interface
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Monthly Budget")) {
                    TextField("Enter budget amount", text: $totalBudgetAsString)
                    Text("Monthly budget is $\(totalBudget, specifier: "%.2f")")
                }
                
                if purchaseCategories.defined.count > 0 {
                    
                    ForEach(purchaseCategories.defined) { category in
                        
                        BarView (category: category,
                                budget: CGFloat(totalBudget))
                        
                        
                    }
                    
                }
                
                Section {
                    List{
                        ForEach(purchaseCategories.defined) { currentCategory in
                            HStack {
                                VStack (alignment:.leading) {
                            NavigationLink(currentCategory.title,
                                           destination: PurchaseCategoryDetailView(category: currentCategory))
                                    Text(currentCategory.description)
                                        .font(.caption)
                                }
                            }
                        }
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
                    .disabled(totalBudget > 0 ? false : true)
                    
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
