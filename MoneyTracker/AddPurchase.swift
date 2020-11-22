//
//  AddPurchase.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-20.
//

import SwiftUI

struct AddPurchase: View {
  
    @State private var amount = ""
    @State private var description = ""
    
    //ask if crrecg
    @State private var date = Date()
    
    
    var body: some View {
        NavigationView {
            Form {
                
                Section(header: Text("Amount Spent")) {
                    TextField("e.g 20", text: $amount)
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
                        saveCategory()
                    }, label: {
                        Text("Save")
                    })
                    
                }
            }
        }
        
        
    }
}

struct AddPurchase_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchase()
    }
}
