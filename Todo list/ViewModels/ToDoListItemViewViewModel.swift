//
//  ToDoListItemViewViewModel.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/9/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//view for single todo item
class ToDoListIemViewViewModel: ObservableObject{
    init() {}
    
    func toggleIsDone(item: ToDoListItem){
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }

}
