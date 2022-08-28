//
//  RightButton.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct RightButton: View {
    var body: some View {
        VStack {
            RightArrow()
                .foregroundColor(Color(hex: 0xDF1876))
                .frame(width: 25, height: 25)
            //增加20s
            Text("增加20秒").font(.custom("PingFang SC Regular", size: 10)).tracking(-0.41)
//                .offset(y: -10)
        }
    }
}
struct RightArrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.85185*width, y: 0.37097*height))
        path.addLine(to: CGPoint(x: 0.15741*width, y: 0.72017*height))
        path.addLine(to: CGPoint(x: 0.15741*width, y: 0.02176*height))
        path.addLine(to: CGPoint(x: 0.85185*width, y: 0.37097*height))
        path.closeSubpath()
        return path
    }
}
struct RightButton_Previews: PreviewProvider {
    static var previews: some View {
        RightButton()
    }
}
