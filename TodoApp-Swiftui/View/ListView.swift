//
//  ListView.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listviewmodel: ListViewModel
    var body: some View {
        ZStack{
            if listviewmodel .items.isEmpty {
                NoListView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }else{
                List{
                    ForEach(listviewmodel.items){item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear){
                                    listviewmodel.updateItem(item: item)
                                }
                            }
                        
                    }.onDelete(perform: listviewmodel.deleteItem)
                        .onMove(perform: listviewmodel.moveItem)
                }
            }
        }.navigationTitle("Todo List 📝")
            .navigationBarItems(leading: EditButton(),trailing: NavigationLink("Add",destination: AddView()))
    }
}

#Preview {
    NavigationStack{
        ListView()
    }.environmentObject(ListViewModel())
}
