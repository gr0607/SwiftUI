//
//  User.swift
//  FriendFace
//
//  Created by admin on 16.10.2023.
//

import Foundation

struct Response: Codable {
    let users: [User]
}

struct User: Codable {
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let about: String
    let registered: Date
    let friends: [Friend]
}

struct Friend: Codable {
    let id: String
    let name: String
}
