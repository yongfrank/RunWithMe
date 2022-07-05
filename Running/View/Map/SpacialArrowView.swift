//
//  SpacialArrowView.swift
//  Running
//
//  Created by Frank Chu on 7/5/22.
//

import SwiftUI

struct SpacialArrowView: View {
    
    var body: some View {
        ZStack {
            // Ellipse 565
            Circle()
                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                .frame(width: 20, height: 20)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 4, x: 0, y: 0)

            // Ellipse 566
            Circle()
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
                .frame(width: 68, height: 68)

            // Ellipse 564
            Circle()
                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 0.05999999865889549)))
                .frame(width: 650, height: 650)

            // Ellipse 563
            Circle()
                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 0.05999999865889549)))
                .frame(width: 340, height: 340)

            // Ellipse 562
            Circle()
                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 0.05999999865889549)))
                .frame(width: 226, height: 226)
            VStack {
                ZStack {
                    // Ellipse 566
                    Circle()
                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5)))
                        .frame(width: 68, height: 68)
                    // Ellipse 565
                    Circle()
                        .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                        .frame(width: 20, height: 20)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 4, x: 0, y: 0)
                }
                .offset(y: -75)
                arrow()
                    .frame(width: 90, height: 180)
                    .foregroundColor(Color(hex: "#DF1876"))
                    .offset(y: -35)
            }
        }
    }
}

struct SpacialArrowView_Previews: PreviewProvider {
    static var previews: some View {
        SpacialArrowView()
    }
}

struct arrow: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.41689*width, y: 0.97784*height))
        path.addCurve(to: CGPoint(x: 0.33452*width, y: 0.95634*height), control1: CGPoint(x: 0.37616*width, y: 0.97794*height), control2: CGPoint(x: 0.34871*width, y: 0.97077*height))
        path.addCurve(to: CGPoint(x: 0.31284*width, y: 0.88814*height), control1: CGPoint(x: 0.32034*width, y: 0.94191*height), control2: CGPoint(x: 0.31311*width, y: 0.91917*height))
        path.addCurve(to: CGPoint(x: 0.31299*width, y: 0.82147*height), control1: CGPoint(x: 0.31272*width, y: 0.87403*height), control2: CGPoint(x: 0.31277*width, y: 0.8518*height))
        path.addCurve(to: CGPoint(x: 0.31289*width, y: 0.72465*height), control1: CGPoint(x: 0.31322*width, y: 0.79113*height), control2: CGPoint(x: 0.31318*width, y: 0.75886*height))
        path.addCurve(to: CGPoint(x: 0.31275*width, y: 0.62464*height), control1: CGPoint(x: 0.31259*width, y: 0.69043*height), control2: CGPoint(x: 0.31255*width, y: 0.6571*height))
        path.addCurve(to: CGPoint(x: 0.31281*width, y: 0.54739*height), control1: CGPoint(x: 0.31296*width, y: 0.59219*height), control2: CGPoint(x: 0.31298*width, y: 0.56644*height))
        path.addCurve(to: CGPoint(x: 0.30281*width, y: 0.48392*height), control1: CGPoint(x: 0.31355*width, y: 0.52058*height), control2: CGPoint(x: 0.31022*width, y: 0.49943*height))
        path.addCurve(to: CGPoint(x: 0.25243*width, y: 0.46076*height), control1: CGPoint(x: 0.2954*width, y: 0.46842*height), control2: CGPoint(x: 0.27861*width, y: 0.4607*height))
        path.addCurve(to: CGPoint(x: 0.18332*width, y: 0.45934*height), control1: CGPoint(x: 0.23303*width, y: 0.46081*height), control2: CGPoint(x: 0.21*width, y: 0.46033*height))
        path.addCurve(to: CGPoint(x: 0.11422*width, y: 0.45791*height), control1: CGPoint(x: 0.15665*width, y: 0.45834*height), control2: CGPoint(x: 0.13361*width, y: 0.45787*height))
        path.addCurve(to: CGPoint(x: 0.04931*width, y: 0.4369*height), control1: CGPoint(x: 0.08027*width, y: 0.45729*height), control2: CGPoint(x: 0.05864*width, y: 0.45029*height))
        path.addCurve(to: CGPoint(x: 0.06996*width, y: 0.38606*height), control1: CGPoint(x: 0.03998*width, y: 0.42352*height), control2: CGPoint(x: 0.04687*width, y: 0.40657*height))
        path.addCurve(to: CGPoint(x: 0.15223*width, y: 0.31179*height), control1: CGPoint(x: 0.09305*width, y: 0.36484*height), control2: CGPoint(x: 0.12048*width, y: 0.34009*height))
        path.addCurve(to: CGPoint(x: 0.24966*width, y: 0.22373*height), control1: CGPoint(x: 0.18399*width, y: 0.2835*height), control2: CGPoint(x: 0.21646*width, y: 0.25414*height))
        path.addCurve(to: CGPoint(x: 0.3478*width, y: 0.13461*height), control1: CGPoint(x: 0.28285*width, y: 0.19332*height), control2: CGPoint(x: 0.31556*width, y: 0.16361*height))
        path.addCurve(to: CGPoint(x: 0.43222*width, y: 0.05716*height), control1: CGPoint(x: 0.38003*width, y: 0.10561*height), control2: CGPoint(x: 0.40817*width, y: 0.07979*height))
        path.addCurve(to: CGPoint(x: 0.49813*width, y: 0.02578*height), control1: CGPoint(x: 0.45532*width, y: 0.03664*height), control2: CGPoint(x: 0.47729*width, y: 0.02619*height))
        path.addCurve(to: CGPoint(x: 0.56311*width, y: 0.05473*height), control1: CGPoint(x: 0.51898*width, y: 0.02538*height), control2: CGPoint(x: 0.54064*width, y: 0.03503*height))
        path.addCurve(to: CGPoint(x: 0.64374*width, y: 0.12703*height), control1: CGPoint(x: 0.58656*width, y: 0.07513*height), control2: CGPoint(x: 0.61343*width, y: 0.09923*height))
        path.addCurve(to: CGPoint(x: 0.73757*width, y: 0.21358*height), control1: CGPoint(x: 0.67404*width, y: 0.15482*height), control2: CGPoint(x: 0.70532*width, y: 0.18367*height))
        path.addCurve(to: CGPoint(x: 0.83361*width, y: 0.30171*height), control1: CGPoint(x: 0.76983*width, y: 0.24349*height), control2: CGPoint(x: 0.80184*width, y: 0.27286*height))
        path.addCurve(to: CGPoint(x: 0.91791*width, y: 0.37876*height), control1: CGPoint(x: 0.86537*width, y: 0.33056*height), control2: CGPoint(x: 0.89347*width, y: 0.35625*height))
        path.addCurve(to: CGPoint(x: 0.94898*width, y: 0.43954*height), control1: CGPoint(x: 0.94527*width, y: 0.40339*height), control2: CGPoint(x: 0.95563*width, y: 0.42365*height))
        path.addCurve(to: CGPoint(x: 0.88663*width, y: 0.46244*height), control1: CGPoint(x: 0.94233*width, y: 0.45543*height), control2: CGPoint(x: 0.92155*width, y: 0.46306*height))
        path.addLine(to: CGPoint(x: 0.85172*width, y: 0.46252*height))
        path.addLine(to: CGPoint(x: 0.80954*width, y: 0.46262*height))
        path.addCurve(to: CGPoint(x: 0.76664*width, y: 0.46325*height), control1: CGPoint(x: 0.79499*width, y: 0.46265*height), control2: CGPoint(x: 0.78069*width, y: 0.46286*height))
        path.addCurve(to: CGPoint(x: 0.7281*width, y: 0.46387*height), control1: CGPoint(x: 0.75258*width, y: 0.46363*height), control2: CGPoint(x: 0.73973*width, y: 0.46384*height))
        path.addCurve(to: CGPoint(x: 0.68242*width, y: 0.47985*height), control1: CGPoint(x: 0.70385*width, y: 0.46393*height), control2: CGPoint(x: 0.68863*width, y: 0.46925*height))
        path.addCurve(to: CGPoint(x: 0.67333*width, y: 0.52326*height), control1: CGPoint(x: 0.6762*width, y: 0.49045*height), control2: CGPoint(x: 0.67318*width, y: 0.50492*height))
        path.addCurve(to: CGPoint(x: 0.6733*width, y: 0.60368*height), control1: CGPoint(x: 0.67351*width, y: 0.54372*height), control2: CGPoint(x: 0.6735*width, y: 0.57052*height))
        path.addCurve(to: CGPoint(x: 0.67347*width, y: 0.70739*height), control1: CGPoint(x: 0.6731*width, y: 0.63684*height), control2: CGPoint(x: 0.67316*width, y: 0.67141*height))
        path.addCurve(to: CGPoint(x: 0.67364*width, y: 0.81215*height), control1: CGPoint(x: 0.67378*width, y: 0.74337*height), control2: CGPoint(x: 0.67384*width, y: 0.77829*height))
        path.addCurve(to: CGPoint(x: 0.67363*width, y: 0.89469*height), control1: CGPoint(x: 0.67345*width, y: 0.84601*height), control2: CGPoint(x: 0.67345*width, y: 0.87353*height))
        path.addCurve(to: CGPoint(x: 0.67024*width, y: 0.92327*height), control1: CGPoint(x: 0.67371*width, y: 0.90386*height), control2: CGPoint(x: 0.67258*width, y: 0.91339*height))
        path.addCurve(to: CGPoint(x: 0.65665*width, y: 0.95029*height), control1: CGPoint(x: 0.6679*width, y: 0.93315*height), control2: CGPoint(x: 0.66337*width, y: 0.94216*height))
        path.addCurve(to: CGPoint(x: 0.62701*width, y: 0.96994*height), control1: CGPoint(x: 0.64994*width, y: 0.95842*height), control2: CGPoint(x: 0.64005*width, y: 0.96496*height))
        path.addCurve(to: CGPoint(x: 0.57398*width, y: 0.97747*height), control1: CGPoint(x: 0.61396*width, y: 0.9749*height), control2: CGPoint(x: 0.59628*width, y: 0.97741*height))
        path.addCurve(to: CGPoint(x: 0.49835*width, y: 0.97817*height), control1: CGPoint(x: 0.5478*width, y: 0.97753*height), control2: CGPoint(x: 0.52259*width, y: 0.97777*height))
        path.addCurve(to: CGPoint(x: 0.41689*width, y: 0.97784*height), control1: CGPoint(x: 0.47411*width, y: 0.97859*height), control2: CGPoint(x: 0.44696*width, y: 0.97847*height))
        path.addLine(to: CGPoint(x: 0.41689*width, y: 0.97784*height))
        path.closeSubpath()
        return path
    }
}
