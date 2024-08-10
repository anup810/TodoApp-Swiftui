//
//  ListRowView.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import SwiftUI

private var item1 = ItemModel(Title: "Item 1", IsCompleted: true)
private var item2 = ItemModel(Title: "Item 2", IsCompleted: false)

struct ListRowView: View {
    let item : ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }.font(.title2)
            .padding(.vertical,8)
    }
}

#Preview {
    Group{
        ListRowView(item: item1)
        ListRowView(item: item2)
    }.previewLayout(.sizeThatFits)
}
