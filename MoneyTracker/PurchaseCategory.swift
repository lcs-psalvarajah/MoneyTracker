
//  File.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-20.
//

import Foundation

class PurchaseCategory: ObservableObject, Identifiable {
    
    var id = UUID()
    var title: String
    var description: String
    var totalOfAllPurchases: Double
    @Published var purchases: [Purchase]

    
    init(title: String, description: String, totalOfAllPurchases: Double = 0.0, purchases: [Purchase] = []) {
        
        self.totalOfAllPurchases = totalOfAllPurchases
        self.title = title
        self.description = description
        self.purchases = purchases
    }
    
}



