//
//  AddPurchaseCategory.swift
//  MoneyTracker
//
//  Created by Salvarajah, Prajina on 2020-11-20.
//

import SwiftUI

struct AddPurchaseCategory: View {
    
    @State private var title = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                
                Section (header: Text("Title")) {
                    
                    TextField("e.g.: transportation", text: $title)
                }
                
                Section (header: Text("Description")) {
                    
                    TextField("e.g.: Went to ...", text: $description)
                }
                
            }
            .navigationTitle("Add Purchase Category")
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                    
                    Button(action: {
                        print("Here is where a category gets created")
                    }, label: {
                        Text("Save")
                    })
                    
                }
            }

        }
    }
}


struct AddPurchaseCategory_Previews: PreviewProvider {
    static var previews: some View {
        AddPurchaseCategory()
    }
}
