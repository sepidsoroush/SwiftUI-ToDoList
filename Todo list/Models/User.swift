//
//  User.swift
//  Todo list
//
//  Created by Sepideh Soroush on 10/9/24.
//

import Foundation

struct User: Codable{
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
