//
//  SettingsShape.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct SettingsShape: View {
    var body: some View {
        GearShape()
            .frame(width: 28, height: 28)
    }
}
struct GearShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.93799*width, y: 0.40532*height))
        path.addLine(to: CGPoint(x: 0.93798*width, y: 0.40532*height))
        path.addLine(to: CGPoint(x: 0.85776*width, y: 0.3875*height))
        path.addCurve(to: CGPoint(x: 0.83393*width, y: 0.32998*height), control1: CGPoint(x: 0.8515*width, y: 0.36753*height), control2: CGPoint(x: 0.84336*width, y: 0.34839*height))
        path.addLine(to: CGPoint(x: 0.87734*width, y: 0.25771*height))
        path.addCurve(to: CGPoint(x: 0.87734*width, y: 0.16929*height), control1: CGPoint(x: 0.89355*width, y: 0.23179*height), control2: CGPoint(x: 0.9017*width, y: 0.1937*height))
        path.addLine(to: CGPoint(x: 0.8331*width, y: 0.1251*height))
        path.addCurve(to: CGPoint(x: 0.78901*width, y: 0.10811*height), control1: CGPoint(x: 0.82119*width, y: 0.11313*height), control2: CGPoint(x: 0.80517*width, y: 0.10811*height))
        path.addCurve(to: CGPoint(x: 0.74267*width, y: 0.12236*height), control1: CGPoint(x: 0.77226*width, y: 0.10811*height), control2: CGPoint(x: 0.75531*width, y: 0.11358*height))
        path.addLine(to: CGPoint(x: 0.67231*width, y: 0.16719*height))
        path.addCurve(to: CGPoint(x: 0.61518*width, y: 0.14316*height), control1: CGPoint(x: 0.65404*width, y: 0.15771*height), control2: CGPoint(x: 0.635*width, y: 0.14961*height))
        path.addLine(to: CGPoint(x: 0.59716*width, y: 0.06201*height))
        path.addCurve(to: CGPoint(x: 0.53125*width, y: 0), control1: CGPoint(x: 0.59179*width, y: 0.03223*height), control2: CGPoint(x: 0.56576*width, y: 0))
        path.addLine(to: CGPoint(x: 0.46875*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.40625*width, y: 0.0625*height), control1: CGPoint(x: 0.43423*width, y: 0), control2: CGPoint(x: 0.41308*width, y: 0.03272*height))
        path.addLine(to: CGPoint(x: 0.38618*width, y: 0.14267*height))
        path.addCurve(to: CGPoint(x: 0.32534*width, y: 0.16826*height), control1: CGPoint(x: 0.36504*width, y: 0.14941*height), control2: CGPoint(x: 0.34467*width, y: 0.15805*height))
        path.addLine(to: CGPoint(x: 0.25322*width, y: 0.12236*height))
        path.addCurve(to: CGPoint(x: 0.20683*width, y: 0.1081*height), control1: CGPoint(x: 0.24053*width, y: 0.11357*height), control2: CGPoint(x: 0.22363*width, y: 0.1081*height))
        path.addCurve(to: CGPoint(x: 0.16274*width, y: 0.1251*height), control1: CGPoint(x: 0.19072*width, y: 0.1081*height), control2: CGPoint(x: 0.17471*width, y: 0.11313*height))
        path.addLine(to: CGPoint(x: 0.11855*width, y: 0.16929*height))
        path.addCurve(to: CGPoint(x: 0.11855*width, y: 0.25771*height), control1: CGPoint(x: 0.09414*width, y: 0.1937*height), control2: CGPoint(x: 0.10234*width, y: 0.23179*height))
        path.addLine(to: CGPoint(x: 0.16421*width, y: 0.33379*height))
        path.addCurve(to: CGPoint(x: 0.14219*width, y: 0.3875*height), control1: CGPoint(x: 0.15566*width, y: 0.35107*height), control2: CGPoint(x: 0.14805*width, y: 0.36885*height))
        path.addLine(to: CGPoint(x: 0.06201*width, y: 0.40531*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.47124*height), control1: CGPoint(x: 0.03223*width, y: 0.41069*height), control2: CGPoint(x: 0, y: 0.43671*height))
        path.addLine(to: CGPoint(x: 0, y: 0.53374*height))
        path.addCurve(to: CGPoint(x: 0.0625*width, y: 0.59624*height), control1: CGPoint(x: 0, y: 0.56826*height), control2: CGPoint(x: 0.03271*width, y: 0.58941*height))
        path.addLine(to: CGPoint(x: 0.1437*width, y: 0.6165*height))
        path.addCurve(to: CGPoint(x: 0.16426*width, y: 0.6663*height), control1: CGPoint(x: 0.14932*width, y: 0.63374*height), control2: CGPoint(x: 0.15629*width, y: 0.65029*height))
        path.addLine(to: CGPoint(x: 0.11856*width, y: 0.74248*height))
        path.addCurve(to: CGPoint(x: 0.11856*width, y: 0.83085*height), control1: CGPoint(x: 0.10235*width, y: 0.76835*height), control2: CGPoint(x: 0.09419*width, y: 0.80644*height))
        path.addLine(to: CGPoint(x: 0.16279*width, y: 0.87505*height))
        path.addCurve(to: CGPoint(x: 0.20688*width, y: 0.89209*height), control1: CGPoint(x: 0.17471*width, y: 0.88701*height), control2: CGPoint(x: 0.19072*width, y: 0.89209*height))
        path.addCurve(to: CGPoint(x: 0.25322*width, y: 0.87783*height), control1: CGPoint(x: 0.22363*width, y: 0.89209*height), control2: CGPoint(x: 0.24057*width, y: 0.88662*height))
        path.addLine(to: CGPoint(x: 0.32549*width, y: 0.83174*height))
        path.addCurve(to: CGPoint(x: 0.38672*width, y: 0.85752*height), control1: CGPoint(x: 0.34497*width, y: 0.84204*height), control2: CGPoint(x: 0.36543*width, y: 0.85078*height))
        path.addLine(to: CGPoint(x: 0.40674*width, y: 0.9375*height))
        path.addCurve(to: CGPoint(x: 0.46924*width, y: height), control1: CGPoint(x: 0.41357*width, y: 0.96728*height), control2: CGPoint(x: 0.43471*width, y: height))
        path.addLine(to: CGPoint(x: 0.53174*width, y: height))
        path.addCurve(to: CGPoint(x: 0.59766*width, y: 0.93799*height), control1: CGPoint(x: 0.56626*width, y: height), control2: CGPoint(x: 0.59229*width, y: 0.96777*height))
        path.addLine(to: CGPoint(x: 0.61567*width, y: 0.85659*height))
        path.addCurve(to: CGPoint(x: 0.67217*width, y: 0.83291*height), control1: CGPoint(x: 0.6353*width, y: 0.85024*height), control2: CGPoint(x: 0.65415*width, y: 0.84223*height))
        path.addLine(to: CGPoint(x: 0.74267*width, y: 0.87783*height))
        path.addCurve(to: CGPoint(x: 0.78901*width, y: 0.89209*height), control1: CGPoint(x: 0.75532*width, y: 0.88662*height), control2: CGPoint(x: 0.77227*width, y: 0.89209*height))
        path.addCurve(to: CGPoint(x: 0.83311*width, y: 0.87505*height), control1: CGPoint(x: 0.80517*width, y: 0.89209*height), control2: CGPoint(x: 0.82119*width, y: 0.88701*height))
        path.addLine(to: CGPoint(x: 0.87734*width, y: 0.83086*height))
        path.addCurve(to: CGPoint(x: 0.87734*width, y: 0.74248*height), control1: CGPoint(x: 0.90171*width, y: 0.80644*height), control2: CGPoint(x: 0.89355*width, y: 0.76836*height))
        path.addLine(to: CGPoint(x: 0.83389*width, y: 0.67011*height))
        path.addCurve(to: CGPoint(x: 0.8563*width, y: 0.6165*height), control1: CGPoint(x: 0.84262*width, y: 0.65293*height), control2: CGPoint(x: 0.8502*width, y: 0.63506*height))
        path.addLine(to: CGPoint(x: 0.9375*width, y: 0.59624*height))
        path.addCurve(to: CGPoint(x: width, y: 0.53374*height), control1: CGPoint(x: 0.96729*width, y: 0.58941*height), control2: CGPoint(x: width, y: 0.56826*height))
        path.addLine(to: CGPoint(x: width, y: 0.47124*height))
        path.addCurve(to: CGPoint(x: 0.93799*width, y: 0.40532*height), control1: CGPoint(x: width, y: 0.43672*height), control2: CGPoint(x: 0.96777*width, y: 0.41069*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.50087*width, y: 0.65117*height))
        path.addCurve(to: CGPoint(x: 0.34965*width, y: 0.50039*height), control1: CGPoint(x: 0.41752*width, y: 0.65117*height), control2: CGPoint(x: 0.34965*width, y: 0.58349*height))
        path.addCurve(to: CGPoint(x: 0.50087*width, y: 0.34965*height), control1: CGPoint(x: 0.34965*width, y: 0.41728*height), control2: CGPoint(x: 0.41752*width, y: 0.34965*height))
        path.addCurve(to: CGPoint(x: 0.65205*width, y: 0.50039*height), control1: CGPoint(x: 0.58422*width, y: 0.34965*height), control2: CGPoint(x: 0.65205*width, y: 0.41728*height))
        path.addCurve(to: CGPoint(x: 0.50087*width, y: 0.65117*height), control1: CGPoint(x: 0.65205*width, y: 0.58349*height), control2: CGPoint(x: 0.58422*width, y: 0.65117*height))
        path.closeSubpath()
        return path
    }
}
struct SettingsShape_Previews: PreviewProvider {
    static var previews: some View {
        SettingsShape()
    }
}
