//
//  ListViewModel.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import Foundation

class ListViewModel: ObservableObject {
   @Published var items: [ItemModel] = []
    
    //must be unique
    let itemsKey: String = "items_List"
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodeData, forKey: itemsKey)
        }
    }
    
    
    
}
