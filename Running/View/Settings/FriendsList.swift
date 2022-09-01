//
//  FriendsList.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI
import Kingfisher


struct FriendsList: View {
    @EnvironmentObject var vm: MainPageViewMode
    
    let layoutGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                VStack {
                    if let users = vm.users {
                        LazyVGrid(columns: layoutGrid) {
                            ForEach(users, id: \.self) { user in
                                // Will Not Show Logged in User Infomation
                                if vm.currentLogInUser?.uid != user.uid {
                                    FriendsAvater(user: user)
                                        .accessibilityElement(children: .combine)
                                }
                            }
                        }
                        .frame(minWidth: 300, idealWidth: 350, maxWidth: 400)
                    } else {
                        ProgressView()
                    }
                }
            }
            .frame(width: geo.size.width)
            .toolbar(content: {
                ToolbarItem {
                    Button {
                        vm.fetchAllUsers()
                    } label: {
                        Image(systemName: "arrow.clockwise")
                            .accessibilityHint("重新加载页面")
                    }
                }
            })
            .navigationTitle(SettingsConstants.friendsList.rawValue)
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct FriendsList_Previews: PreviewProvider {
    static var previews: some View {
        FriendsList()
            .environmentObject(MainPageViewMode())
    }
}

fileprivate struct FriendsAvater: View {
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
            }
        }
        .frame(width: 144, height: 137)
    }
}

struct FriendsAvater_Previews: PreviewProvider {
    static var previews: some View {
        FriendsAvater(user: .accountExample)
    }
}
