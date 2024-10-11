//
//  ProfileView.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/8/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()

    var body: some View {
        NavigationView{
            VStack{
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(Color.blue)
            .frame(width: 125 , height: 125)
            .padding()

        //User info
        VStack(alignment: .leading){
            HStack{
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            HStack{
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            HStack{
                Text("Member since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        .padding()

        
        //Sign out
        Button("Log Out") {
            viewModel.logOut()
        }
        .tint(.red)
        .padding()
    }
}

#Preview {
    ProfileView()
}
