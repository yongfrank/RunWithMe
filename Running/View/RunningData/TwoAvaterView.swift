//
//  TwoAvaterView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI

struct TwoAvaterView: View {
    let currentUser: UserInformation
    let withUser: UserInformation?
    let sizeOfProfile: CGFloat
    var displayWithName = true
    
    var body: some View {
        VStack {
            ZStack {
                DetailedView.avaterDisplayWithoutName(user: currentUser, sizeOfProfile: sizeOfProfile)
                    .offset(x: 20, y: 0)
                DetailedView.avaterDisplayWithoutName(user: withUser, sizeOfProfile: sizeOfProfile)
                    .offset(x: -20, y: 0)
            }
            if displayWithName {
                Text("与\(withUser?.username ?? "")")
                    .font(.custom("PingFang SC Regular", size: 16))
                    .frame(minWidth: 70)
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("头像: \(currentUser.username)和\(withUser?.username ?? "未选择")")
    }
}

extension TwoAvaterView {
    init(currentUser: UserInformation, withUser: UserInformation?, sizeOfProfile: CGFloat) {
        self.currentUser = currentUser
        self.withUser = withUser
        self.sizeOfProfile = sizeOfProfile
    }
}
struct TwoAvater_Previews: PreviewProvider {
    static var previews: some View {
        TwoAvaterView(currentUser: .accountExample, withUser: .accountExample, sizeOfProfile: 50)
        TwoAvaterView(currentUser: .accountExample, withUser: .accountExample, sizeOfProfile: 50, displayWithName: false)
    }
}
