//
//  DetailedView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI
import Kingfisher

class DetailedView {
    
    static let shared = DetailedView()
    
    static func overlayBorder() -> some View {
        RoundedRectangle(cornerRadius: 64)
            .stroke(.black, lineWidth: 0)
    }
    
    static func avaterDisplay(user: UserInformation?, sizeOfProfile: CGFloat) -> some View {
        VStack {
            if let user = user {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .cornerRadius(64)
                    .overlay(
                        Self.overlayBorder()
                    )
                Text(user.username)
                    .font(.custom("PingFang SC Regular", size: 16))
            } else {
                Image(UserInformation.EXAMPLE.profileImageUrl)
                    .resizable()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .overlay(
                        Self.overlayBorder()
                    )
                Text("加载中")
            }
        }
    }
    static func avaterDisplayWithoutName(user: UserInformation?, sizeOfProfile: CGFloat) -> some View {
        VStack {
            if let user = user {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .cornerRadius(64)
                    .overlay(
                        Self.overlayBorder()
                    )
            } else {
                Image(UserInformation.EXAMPLE.profileImageUrl)
                    .resizable()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .overlay(
                        Self.overlayBorder()
                    )
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView.avaterDisplay(user: .accountExample, sizeOfProfile: 76)
    }
}
