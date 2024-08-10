//
//  ListViewModel.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import Foundation

class ListViewModel: ObservableObject {
    @Published var items: [ItemModel] = [] {
        didSet{
            saveItems()
        }
    }
    init(){
        getItems()
    }
    
    
    //must be unique
    let itemsKey: String = "items_List"
    
    func getItems(){
        // get the data from userDefault
        guard let data = UserDefaults.standard.data(forKey: itemsKey) else {return}
        guard let saveData = try? JSONDecoder().decode([ItemModel].self, from: data) else {return}
        
        self.items = saveData
    }
    
    func saveItems(){
        if let encodeData = try? JSONEncoder().encode(items){
            UserDefaults.standard.setValue(encodeData, forKey: itemsKey)
        }
    }
    
    
    //func to add item
    func addItem(title:String){
        let newItem = ItemModel(Title: title, IsCompleted: false)
        items.append(newItem)
    }
    //update
    
    func updateItem(item:ItemModel){
        if let index = items.firstIndex(where: {  $0.id == item.id}){
            items[index] = item.updateCompleted()
        }
    }
    // delete item
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    //move items
    func moveItems(from: IndexSet , to:Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    
}
