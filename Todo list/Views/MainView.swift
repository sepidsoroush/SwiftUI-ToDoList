//
//  ContentView.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/8/24.
//

import SwiftData
import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()

    var body: some View {
        if viewModel.isSignedIn && !viewModel.currentUserId.isEmpty {
            accountView
        } else {
            LoginView()
        }
    }

    @ViewBuilder
    var accountView: some View {
        TabView {
            ToDoListView(userId: viewModel.currentUserId)
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }

}

#Preview {
    MainView()
}
