//
//  ConnectFriendsView.swift
//  Running
//
//  Created by Frank Chu on 6/27/22.
//

import SwiftUI

struct ConnectFriendsView: View {
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer().frame(height: proxy.size.height * 0.25)
                // 附近好友连接中…
                HStack {
                    Spacer().frame(width: proxy.size.width * 0.106)
                    Text("附近好友连接中…")
                        .font(.custom("PingFang SC Semibold", size: 36))
                        .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                        .tracking(-0.41)
                    Spacer()
                }

                Spacer()

                NavigationLink {
//                    ConnectFriendsView()
                    ContentView()
                } label: {
                    ZStack {
                        // Rectangle 7
                        RoundedRectangle(cornerRadius: 16)
                            .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                            .frame(width: 282, height: 69)
                            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 20, x: 2, y: 8)
                        // 完成
                        Text("完成").font(.custom("PingFang SC Semibold", size: 36)).foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.09, blue: 0.46, alpha: 1))).tracking(30.09)
                    }
                }
                Spacer().frame(height: proxy.size.height * 0.15)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "#DF1876"))
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ConnectFriendsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ConnectFriendsView()
                .previewDevice("iPhone 13")
        }
    }
}
