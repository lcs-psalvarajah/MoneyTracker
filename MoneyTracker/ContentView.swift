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
            .onAppear() {
                
                //place some example data in the list of categories
                purchaseCategories.defined.append(PurchaseCategory(title: "Transportation", description: "When you go places use this."))
                
                purchaseCategories.defined.append(PurchaseCategory(title: "Recreation", description: "When doing things for fun."))
            }
            
            
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
