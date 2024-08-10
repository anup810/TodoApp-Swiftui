//
//  AddView.swift
//  TodoApp-Swiftui
//
//  Created by Anup Saud on 2024-08-09.
//

import SwiftUI

struct AddView: View {
    //dimiss a view
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var listviewmodel: ListViewModel
    @State var textFieldTtext:String = " "
    @State var alertTitle: String = " "
    @State var showAlert: Bool = false
    
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Type something here...",text: $textFieldTtext)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(hue: 0.621, saturation: 0.048, brightness: 0.916))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                Button(action: saveButtonTapped, label: {
                    Text("Save")
                        .foregroundStyle(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .background(Color.accentColor)
                
                })
                
            }.padding()
        }.navigationTitle("Add an Item")
            .alert(isPresented: $showAlert,content: getAlert)
        
    }
    func saveButtonTapped(){
        if textIsValid() {
            listviewmodel.addItem(title: textFieldTtext)
            dismiss()
        }
    }
    func getAlert() -> Alert{
        return Alert(title: Text(alertTitle))
    }
    
    func textIsValid() -> Bool {
        if textFieldTtext.count < 3{
            alertTitle = "Your todo item should contain atleast 3 characters"
            showAlert.toggle()
            return false
        }
        return true
    }
}

#Preview {
    NavigationStack{
        AddView()
    }
}
