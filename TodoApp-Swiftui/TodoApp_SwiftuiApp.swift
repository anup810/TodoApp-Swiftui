//
//  TodoApp_SwiftuiApp.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import SwiftUI

@main
struct TodoApp_SwiftuiApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
