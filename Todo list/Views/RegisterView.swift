//
//  RegisterView.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/8/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //Header
            HeaderView(title : "Register" , subtitle: "Start organizing todos", angle: -15, background: .orange)
            
            //Register form
            Form {
                TextField("Full name" , text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address" , text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Register",
                    background: .green
                ) {
                    //attemt to register
                    viewModel.register()
                 }
                .padding()
            }
            .offset(y: -50)
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
