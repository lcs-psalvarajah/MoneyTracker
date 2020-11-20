//
//  ContentView.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-09.
//

import SwiftUI

struct ContentView: View {
    
    // Propert to track purchase categories
    @StateObject private var purchaseCategories = PurchaseCategories()
    
    
    //Body property defines the user interface
    var body: some View {
        
        NavigationView {
            
            List(purchaseCategories.defined) { category in
                
                Text(category.title)
                
            }
            .navigationTitle("Money Tracker")
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                    
                    Button(action: {
                        print("Here's where we would add a category")
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
