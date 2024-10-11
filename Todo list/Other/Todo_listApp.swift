//
//  Todo_listApp.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/8/24.
//

import FirebaseCore
import SwiftData
import SwiftUI

@main
struct Todo_listApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
