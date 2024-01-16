//
//  UserDetailsView.swift
//  DataModel
//
//  Created by Kambiz on 2024-01-16.
//

import SwiftUI

struct UserDetailsView: View {
    
    @Environment (\.dismiss) var dismiss
    let userDetail: UserModel
    
    var body: some View {
        ScrollView{
            VStack{
                Image(userDetail.userImage ?? "user1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(Circle())
                
                VStack(alignment: .leading){
                    Text("FullName: \(userDetail.userFullName)")
                    Text("Follower: \(userDetail.userFollower)")
                }
                .font(.footnote)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            }
            .frame(width: UIScreen.main.bounds.width - 72)
            .padding(.vertical)
            .background(.gray.opacity(0.1))
            .clipShape(RoundedRectangle(cornerRadius: 10.0))
            .navigationTitle("\(userDetail.userName)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Image(systemName: "chevron.left")
                        .imageScale(.large)
                        .onTapGesture {
                            dismiss()
                        }
                }
            }
            Spacer()
        }
    }
}

#Preview {
    UserDetailsView( userDetail: UserModel(userImage: "user1", userName: "Kambizvb6", userFullName: "Kambiz dehghani", userFollower: 120))
}
