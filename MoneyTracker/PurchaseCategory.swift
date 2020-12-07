
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
    var totalOfAllPurchases: Double = 0.0
    @Published var purchases: [Purchase]

    
    init(title: String, description: String, purchases: [Purchase] = []) {
        
        self.title = title
        self.description = description
        self.purchases = purchases
    }
    
}



