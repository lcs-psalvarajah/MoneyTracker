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

    //Body property defines the user interface
    var body: some View {

        NavigationView {
            
            List(purchaseCategories.defined) { currentCategory in
                
                NavigationLink(currentCategory.title,
                               destination: PurchaseCategoryDetailView(category: currentCategory))
                

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
