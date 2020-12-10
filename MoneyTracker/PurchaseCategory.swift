
//  File.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-20.
//

import Foundation

class PurchaseCategory: ObservableObject, Identifiable {
    
    var id = UUID()
    @Published var title: String
    var description: String
    @Published var totalOfAllPurchases: Double
    @Published var purchases: [Purchase]

    
    init(title: String, description: String, totalOfAllPurchases: Double = 0.0, purchases: [Purchase] = []) {
        
        self.totalOfAllPurchases = totalOfAllPurchases
        self.title = title
        self.description = description
        self.purchases = purchases
    }
    
}

var testData = [
    
    PurchaseCategory(title: "Food", description: "Things I eat", totalOfAllPurchases: 57.00, purchases: [
        Purchase(amount: 7.00, description: "Gum", date: Date()),
        Purchase(amount: 50.00, description: "Milk", date: Date()),
    ]),
    PurchaseCategory(title: "Transporation", description: "For getting to and for", totalOfAllPurchases: 25.00, purchases: [
        Purchase(amount: 25.00, description: "Bus tickets", date: Date()),
    ]),

    
]

