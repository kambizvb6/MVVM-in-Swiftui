//
//  ContentView.swift
//  DataModel
//
//  Created by Kambiz on 2023-12-12.
//

import SwiftUI

struct UserProfileView: View {
    
    // @StateObject -> Use this on Creation or init
    // @ObservedObject -> Use this for subView
    
    
    // ViewModel responsible for managing user data
    @StateObject var userViewModel = UserViewModel()
    
    // State variable for handling search text
    @State private var searchText = ""
    
    // Computed property to filter user models based on search text
    private var searchResult: [UserModel] {
        searchText.isEmpty ? userViewModel.userModel : userViewModel.userModel.filter { user in
            user.userName.localizedCaseInsensitiveContains(searchText)
        }
    }
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    // Display a loading indicator if data is still loading
                    if userViewModel.isLoading {
                        HStack{
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    } else {
                        // Iterate through the filtered user models to display in the list
                        ForEach(searchResult) { user in
                            HStack{
                                Image(user.userImage)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 48, height: 48)
                                    .clipShape(Circle())
                                    
                                VStack(alignment: .leading, spacing: 0.0){
                                    HStack(alignment: .center){
                                        Text(user.userName)
                                            .font(.subheadline)
                                        Image(systemName: "checkmark.seal.fill")
                                            .resizable()
                                            .foregroundStyle(.blue)
                                            .frame(width: 16, height: 16)
                                    }
                                    Text(user.userFullName)
                                        .font(.footnote)
                                        .foregroundStyle(.gray)
                                    
                                }
                                Spacer()
                                VStack(alignment: .center, spacing: 0.0){
                                    Text("\(user.userFollower)")
                                        .font(.subheadline)
                                    Text("Follower")
                                        .font(.footnote)
                                }
                            }
                            // Handle tap gesture on user cell
                            .onTapGesture {
                                print("\(user.userName)")
                            }
                        }
                        // Enable swipe-to-delete functionality
                        .onDelete(perform: userViewModel.deleteUser)
                    }
                }
            }
            // Add search functionality to the view
            .searchable(text: $searchText)
            .navigationTitle("User List")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    UserProfileView()
}
