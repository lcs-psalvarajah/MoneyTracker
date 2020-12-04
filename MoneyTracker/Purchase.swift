//
//  Purchase.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-20.
//

import Foundation

struct Purchase: Identifiable {
    var id = UUID()
    var amount: Double
    var description: String
    var date: Date
}
