//
//  ButtonRectangle.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct ButtonRectangle: View {
    var width: CGFloat = 135
    var height: CGFloat = 111
    var isChoosed: Bool
    var body: some View {
        if isChoosed {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
            .frame(width: width, height: height)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
        } else {
            //Rectangle 4
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 0.32499998807907104, green: 0.32499998807907104, blue: 0.32499998807907104, alpha: 1)))
            .frame(width: width, height: height)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
        }
    }
}

struct ButtonRectangle_Previews: PreviewProvider {
    static var previews: some View {
        ButtonRectangle(isChoosed: false)
    }
}
