//
//  DetailedView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI
import Kingfisher

class DetailedView {
    static func avaterDisplay(user: UserInformation?) -> some View {
        VStack {
            if let user = user {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .frame(width: 76, height: 76)
                    .scaledToFill()
                    .cornerRadius(64)
                    .overlay(
                        RoundedRectangle(cornerRadius: 64)
                            .stroke(.black, lineWidth: 0.3)
                    )
                Text(user.username)
                    .font(.custom("PingFang SC Regular", size: 16))
            } else {
                Image(UserInformation.EXAMPLE.profileImageUrl)
                    .resizable()
                    .frame(width: 76, height: 76)
                    .overlay(
                        RoundedRectangle(cornerRadius: 64)
                            .stroke(.black, lineWidth: 0.3)
                    )
                Text("加载中")
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        DetailedView.avaterDisplay(user: .accountExample)
    }
}
