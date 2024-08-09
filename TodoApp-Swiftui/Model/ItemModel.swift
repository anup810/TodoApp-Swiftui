//
//  ItemModel.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import Foundation

struct ItemModel:Identifiable, Codable {
    let title:String
    let isCompleted: Bool
    let id: String
    
    
    
    init(ID:String = UUID().uuidString,Title:String,IsCompleted:Bool){
        self.id = ID
        self.title = Title
        self.isCompleted = IsCompleted
    }
    func updateCompleted() -> ItemModel{
        return ItemModel(ID: id, Title: title, IsCompleted: !isCompleted)
    }
}
