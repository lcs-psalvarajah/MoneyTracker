//
//  AddPurchase.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-20.
//

import SwiftUI

struct AddPurchase: View {

    @State private var inputAmount = ""
    @State private var description = ""
    @State private var date = Date()
    
    private var amount: Double {
        
        return Double(inputAmount) ?? 0.0
        
    }
    @ObservedObject var category: PurchaseCategory
    
    // Whether we are showing the add activity view or not
    @Binding var addingPurchase: Bool
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Amount Spent")) {
                    TextField("e.g 20", text: $inputAmount)
                }
                
                Section(header: Text("Description")) {
                    TextField("e.g I bought a bus ticket to work", text: $description)
                }
                
                Section(header: Text("Date")) {
                    DatePicker("Please enter a date", selection: $date)
                        .labelsHidden()
                }
            }
            .navigationTitle("Add Purchase Information")
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                    
                    Button(action: {
                        print("Here is where the transaction is recorded")
                        savePurchase()
                    }, label: {
                        Text("Save")
                    })
                    
                }
            }
        }
        
        
    }
  
    func savePurchase() {
        // add the new category to the list of categories
        category.purchases.append(Purchase(amount: amount, description: description, date: date))
        print(category.purchases)
        
        // dismiss the add category view
        addingPurchase = false
    }
}

struct AddPurchase_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchase(category: PurchaseCategory(title: "Food",
                                               description: "Meals, snacks, and so on."),
                    addingPurchase: .constant(true))
        
    }
}
