//
//  UserViewModel.swift
//  DataModel
//
//  Created by Kambiz on 2023-12-14.
//

import Foundation


class UserViewModel:ObservableObject {
    
    @Published var userModel: [UserModel] = []
    @Published var isLoading: Bool = false
    
    init() {
        getUserList()
    }
    
    func getUserList() {
        let user1 = UserModel(userImage: "user1", userName: "Kambizvb6", userFullName: "Kambiz Dehghani", userFollower: 900)
        let user2 = UserModel(userImage: "user2", userName: "VictorR", userFullName: "Victor Rozario", userFollower: 1200)
        let user3 = UserModel(userImage: "user3", userName: "Hitman", userFullName: "Mohamad Moradi", userFollower: 200)
        
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.userModel.append(user1)
            self.userModel.append(user2)
            self.userModel.append(user3)
            self.isLoading = false
        }
    }
    func deleteUser(index: IndexSet) {
        userModel.remove(atOffsets: index)
    }
}
