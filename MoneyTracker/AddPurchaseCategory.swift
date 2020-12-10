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
    @ObservedObject var purchaseCategories: PurchaseCategories
    
    // Whether we are showing the add activity view or not
    @Binding var addingCategory: Bool
    
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
            .navigationTitle("Add Category")
            .toolbar {
                
                ToolbarItem(placement: ToolbarItemPlacement.primaryAction) {
                    
                    Button(action: {
                        print("Here is where a category gets created")
                        saveCategory()
                    }, label: {
                        Text("Save")
                    })
                    
                }
            }
            
            
        }
    }
    
    func saveCategory() {
        // add the new category to the list of categories
        purchaseCategories.defined.append(PurchaseCategory(title: title, description: description))
        print(purchaseCategories.defined)
        
        // dismiss the add category view
        addingCategory = false
    }
    
}


//struct AddPurchaseCategory_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPurchaseCategory()
//    }
//}
