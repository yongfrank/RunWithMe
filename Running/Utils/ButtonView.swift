//
//  ButtonView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import Foundation
import SwiftUI

class ButtonViewTemplate {
    static func buttonView(name: String) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .fill(Color(#colorLiteral(red: 0.875, green: 0.09479165077209473, blue: 0.46929168701171875, alpha: 1)))
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
            Text(name)
                .font(.custom("PingFang SC Semibold", size: 20)).tracking(2.09)
        }
    }
    
    static func barButtonView(name: String) -> some View {
        //Rectangle 4249
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .fill(Color(#colorLiteral(red: 0.9541666507720947, green: 0.9541666507720947, blue: 0.9541666507720947, alpha: 1)))
            HStack {
                Text(name)
                    .font(.custom("PingFang SC Semibold", size: 20)).tracking(1.09)
                Spacer()
                BarButtonTriangle()
                    .frame(width: 12, height: 24)
                    .foregroundColor(Color(#colorLiteral(red: 0.875, green: 0.09479165077209473, blue: 0.46929168701171875, alpha: 1)))
            }
            .padding(.leading, 16)
            .padding(.trailing, 23)
        }
    }
    
    
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Button {
                
            } label: {
                ButtonViewTemplate.buttonView(name: "编辑信息")
            }
            .frame(width: 131, height: 63)
            
            Button {
                
            } label: {
                ButtonViewTemplate.barButtonView(name: "添加好友")
            }
            .frame(width: 311, height: 67)
            
        }
    }
}

fileprivate struct BarButtonTriangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.94107*width, y: 0.46786*height))
        path.addLine(to: CGPoint(x: 0.14226*width, y: 0.03214*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.06428*height), control1: CGPoint(x: 0.08976*width, y: 0.00351*height), control2: CGPoint(x: 0, y: 0.02379*height))
        path.addLine(to: CGPoint(x: 0, y: 0.93572*height))
        path.addCurve(to: CGPoint(x: 0.14226*width, y: 0.96786*height), control1: CGPoint(x: 0, y: 0.97621*height), control2: CGPoint(x: 0.08976*width, y: 0.9965*height))
        path.addLine(to: CGPoint(x: 0.94107*width, y: 0.53214*height))
        path.addCurve(to: CGPoint(x: 0.94107*width, y: 0.46786*height), control1: CGPoint(x: 0.97362*width, y: 0.51439*height), control2: CGPoint(x: 0.97362*width, y: 0.48561*height))
        path.closeSubpath()
        return path
    }
}
