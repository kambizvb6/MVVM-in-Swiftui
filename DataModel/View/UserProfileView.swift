//
//  ContentView.swift
//  DataModel
//
//  Created by Kambiz on 2023-12-12.
//

import SwiftUI

struct UserProfileView: View {
//     @StateObject -> Use this on Creation or init
//     @ObservedObject -> Use this for subView
    
    @StateObject var userViewModel = UserViewModel()
    @State private var searchText = ""
    
    private var searchResult: [UserModel] {
        searchText.isEmpty ? userViewModel.userModel : userViewModel.userModel.filter { user in
            user.userName.localizedCaseInsensitiveContains(searchText)
        }
    }
    var body: some View {
        NavigationStack{
            VStack{
                List{
                    if userViewModel.isLoading {
                        HStack{
                            Spacer()
                            ProgressView()
                            Spacer()
                        }
                    } else {
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
                            .onTapGesture {
                                print("\(user.userName)")
                            }
                        }
                        .onDelete(perform: userViewModel.deleteUser)
                    }
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("User List")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    UserProfileView()
}
