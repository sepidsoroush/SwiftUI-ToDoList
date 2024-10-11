//
//  NewItemView.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/8/24.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top, 20)
            
            Form {
                //Title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //Due date
                DatePicker( "Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //button
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
            }
            .alert( isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"), message: Text("Please fill all the fields and select a date newer than today."))
            }

        }
    }
}

#Preview {
    NewItemView(newItemPresented: Binding(get: {return true}, set: { _ in
        
    }))
}
