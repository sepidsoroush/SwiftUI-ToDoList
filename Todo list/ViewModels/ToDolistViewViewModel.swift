//
//  ToDolistViewViewModel.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/9/24.
//

import Foundation
import FirebaseFirestore

//view model for list of todos
//primary tab
class ToDoListViewViewModel: ObservableObject{
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String){
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
