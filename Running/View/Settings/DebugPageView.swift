//
//  DebugPageView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI
import Kingfisher

struct DebugPageView: View {
    @EnvironmentObject var vm: MainPageViewMode
    let layoutGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        ScrollView {
            if let users = vm.users {
                LazyVGrid(columns: layoutGrid) {
                    ForEach(users, id: \.self) { user in
                        if vm.currentLogInUser?.uid != user.uid {
                            Button {
                                vm.handleSignOut()
                                vm.loginUserWithEmail(email: user.email, password: "123123")
                            } label: {
                                DebugFriendsAvater(user: user)
                                    .accessibilityElement(children: .combine)
                            }
                        }
                    }
                }
                .frame(minWidth: 300, idealWidth: 350, maxWidth: 400)
            } else {
                ProgressView()
            }
            Text("Current Log mode \(FirebaseManager.shared.auth.currentUser?.uid ?? "should log out, no uid")")
            
            Text("id: \(vm.currentLogInUser?.id ?? "Unknown")")
            Text("uid: \(vm.currentLogInUser?.uid ?? "Unkown")")
            Text("email: \(vm.currentLogInUser?.email ?? "Unkown")")
            Text("username: \(vm.currentLogInUser?.username ?? "Unkown")")
            Text("url: \(vm.currentLogInUser?.profileImageUrl ?? "Unkown")")

        }
        .navigationTitle(SettingsConstants.debugApp.rawValue)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem {
                Button {
                    vm.fetchAllUsers()
                } label: {
                    Image(systemName: "arrow.clockwise")
                }
            }
        }
    }
}

struct DebugPageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DebugPageView()
                .environmentObject(MainPageViewMode())
        }
    }
}

fileprivate struct DebugFriendsAvater: View {
    let user: UserInformation
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 1, green: 0.675000011920929, blue: 0.8278836607933044, alpha: 1)))
                .frame(width: 144, height: 137)
            VStack {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 68, height: 68)
                    .cornerRadius(68)
                
                Text(user.username)
                    .font(.custom("PingFang SC Regular", size: 16))
                    .tracking(-0.41)
                
                Text(user.email)
            }
        }
        .frame(width: 144, height: 137)
    }
}
