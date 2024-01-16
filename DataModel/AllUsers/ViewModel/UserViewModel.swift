//
//  UserViewModel.swift
//  DataModel
//
//  Created by Kambiz on 2023-12-14.
//

import Foundation

/// ViewModel for managing user data in the UserProfileView
class UserViewModel:ObservableObject {
    
    /// Published property holding the array of user models
    @Published var userModel: [UserModel] = []
    
    /// Published property indicating whether data is currently being loaded
    @Published var isLoading: Bool = false
    
    /// Initializes the UserViewModel and fetches user data
    init() {
        getUserList()
    }
    
    /// Fetches a list of user data
    func getUserList() {
        let user1 = UserModel(userImage: "user1", userName: "Kambizvb6", userFullName: "Kambiz Dehghani", userFollower: 900)
        let user2 = UserModel(userImage: "user2", userName: "VictorR", userFullName: "Victor Rozario", userFollower: 1200)
        let user3 = UserModel(userImage: "user3", userName: "Hitman", userFullName: "Mohamad Moradi", userFollower: 200)
        
        isLoading = true
        
        // Simulating an API call with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.userModel.append(user1)
            self.userModel.append(user2)
            self.userModel.append(user3)
            self.isLoading = false
        }
    }
    
    /// Deletes a user at the specified index
    func deleteUser(index: IndexSet) {
        userModel.remove(atOffsets: index)
    }
}
