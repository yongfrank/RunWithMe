//
//  ButtonRectangle.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct ButtonRectangle: View {
    var width: CGFloat = 135
    var height: CGFloat = 110
    
    var isChoosed: Bool
    var side: SideOfLeftRight
    var stringDisplay: String
    
    init(isChoosed: Bool, side: SideOfLeftRight, _ stringDisplay: String) {
        self.isChoosed = isChoosed
        self.side = side
        self.stringDisplay = stringDisplay
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(isChoosed
                      ? Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1))
                      : Color(#colorLiteral(red: 0.32499998807907104, green: 0.32499998807907104, blue: 0.32499998807907104, alpha: 1))
                )
//                .aspectRatio(1.35, contentMode: .fit)
                .frame(idealWidth: width, idealHeight: height)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 20, x: 2, y: 8)
            
            VStack {
                Text(stringDisplay)
                    .font(.largeTitle)
                    .fontWeight(.black)
//                    .font(.custom("PingFang SC Semibold", size: 48)).tracking(-0.41)
                Text(side == .left ? "left" : "right").font(.custom("PingFang SC Regular", size: 14)).tracking(-0.41)
                    .accessibilityHidden(true)
            }
            .foregroundColor(isChoosed ? .black : .white)
        }
    }
}

struct ButtonRectangle_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            ButtonRectangle(isChoosed: false, side: .left, "左侧")
            ButtonRectangle(isChoosed: true, side: .right, "右侧")
        }
        .padding()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
