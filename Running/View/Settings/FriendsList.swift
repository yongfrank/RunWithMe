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
        ScrollView {
            
            LazyVGrid(columns: layoutGrid) {
                ForEach(vm.users) { user in
                    if vm.currentUser?.uid != user.uid {
                        FriendsAvater(user: user)
                            .accessibilityElement(children: .combine)
                    }
                }
            }
            .frame(width: 350)
            
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
                    .frame(width: 68, height: 68)
                    .scaledToFill()
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
