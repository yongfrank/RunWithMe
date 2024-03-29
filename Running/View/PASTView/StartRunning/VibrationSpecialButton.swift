//
//  VibrationSpecialButton.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct VibrationSpecialButton: View {
    var vibrationSpecial = true
    var body: some View {
        if vibrationSpecial {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
            .frame(width: 135, height: 51)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
        } else {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 0.32499998807907104, green: 0.32499998807907104, blue: 0.32499998807907104, alpha: 1)))
            .frame(width: 135, height: 51)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
        }
    }
}

struct VibrationSpecialButton_Previews: PreviewProvider {
    static var previews: some View {
        VibrationSpecialButton()
    }
}
