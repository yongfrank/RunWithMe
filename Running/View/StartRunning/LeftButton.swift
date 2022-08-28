//
//  LeftButton.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct LeftButton: View {
    var body: some View {
        VStack {
            LeftArrow()
                .foregroundColor(Color(hex: 0xDF1876))
            .frame(width: 25, height: 25)
            //减少20s
            Text("减少20秒").font(.custom("PingFang SC Regular", size: 10)).tracking(-0.41)
//                .offset(y: -10)
        }
    }
}
struct LeftArrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.14815*width, y: 0.37097*height))
        path.addLine(to: CGPoint(x: 0.84259*width, y: 0.02176*height))
        path.addLine(to: CGPoint(x: 0.84259*width, y: 0.72017*height))
        path.addLine(to: CGPoint(x: 0.14815*width, y: 0.37097*height))
        path.closeSubpath()
        return path
    }
}

struct LeftButton_Previews: PreviewProvider {
    static var previews: some View {
        LeftButton()
    }
}
