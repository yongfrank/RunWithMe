//
//  TwoAvaterView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI

struct TwoAvaterView: View {
    let currentUser: UserInformation
    let withUser: UserInformation
    var body: some View {
        VStack {
            ZStack {
                DetailedView.avaterDisplayWithoutName(user: withUser, sizeOfProfile: 50)
                    .offset(x: 20, y: 0)
                DetailedView.avaterDisplayWithoutName(user: currentUser, sizeOfProfile: 50)
                    .offset(x: -20, y: 0)
            }
            Text("与\(withUser.username)")
                .font(.custom("PingFang SC Regular", size: 16))
        }
        .accessibilityElement(children: .combine)
    }
}

struct TwoAvater_Previews: PreviewProvider {
    static var previews: some View {
        TwoAvaterView(currentUser: .accountExample, withUser: .EXAMPLE)
    }
}
