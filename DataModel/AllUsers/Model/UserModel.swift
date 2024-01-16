//
//  UserModel.swift
//  DataModel
//
//  Created by Kambiz on 2023-12-12.
//

import Foundation

struct UserModel: Hashable, Identifiable{
    
    let id : String = UUID().uuidString
    let userImage: String
    let userName: String
    let userFullName: String
    let userFollower: Int
    
    init(userImage: String, userName: String, userFullName: String, userFollower: Int) {
        self.userImage = userImage
        self.userName = userName
        self.userFullName = userFullName
        self.userFollower = userFollower
    }
}
