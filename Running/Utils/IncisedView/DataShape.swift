//
//  DataShape.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct DataShape: View {
    var body: some View {
        DataSmallIncisedShape()
            .frame(width: 29, height: 28)
    }
}

struct DataSmallIncisedShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.07692*width, y: 0))
        path.addCurve(to: CGPoint(x: 0.02253*width, y: 0.02253*height), control1: CGPoint(x: 0.05652*width, y: 0), control2: CGPoint(x: 0.03696*width, y: 0.0081*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.07692*height), control1: CGPoint(x: 0.0081*width, y: 0.03696*height), control2: CGPoint(x: 0, y: 0.05652*height))
        path.addLine(to: CGPoint(x: 0, y: 0.55954*height))
        path.addCurve(to: CGPoint(x: 0.00318*width, y: 0.57013*height), control1: CGPoint(x: 0, y: 0.5633*height), control2: CGPoint(x: 0.0011*width, y: 0.56699*height))
        path.addCurve(to: CGPoint(x: 0.01166*width, y: 0.57722*height), control1: CGPoint(x: 0.00525*width, y: 0.57327*height), control2: CGPoint(x: 0.0082*width, y: 0.57574*height))
        path.addCurve(to: CGPoint(x: 0.02264*width, y: 0.57847*height), control1: CGPoint(x: 0.01512*width, y: 0.5787*height), control2: CGPoint(x: 0.01894*width, y: 0.57914*height))
        path.addCurve(to: CGPoint(x: 0.0325*width, y: 0.57346*height), control1: CGPoint(x: 0.02635*width, y: 0.5778*height), control2: CGPoint(x: 0.02978*width, y: 0.57606*height))
        path.addLine(to: CGPoint(x: 0.30038*width, y: 0.31831*height))
        path.addCurve(to: CGPoint(x: 0.3236*width, y: 0.30783*height), control1: CGPoint(x: 0.30671*width, y: 0.31228*height), control2: CGPoint(x: 0.31489*width, y: 0.30858*height))
        path.addCurve(to: CGPoint(x: 0.34827*width, y: 0.31415*height), control1: CGPoint(x: 0.3323*width, y: 0.30707*height), control2: CGPoint(x: 0.341*width, y: 0.30931*height))
        path.addLine(to: CGPoint(x: 0.65058*width, y: 0.51569*height))
        path.addCurve(to: CGPoint(x: 0.66416*width, y: 0.51873*height), control1: CGPoint(x: 0.65457*width, y: 0.51836*height), control2: CGPoint(x: 0.65941*width, y: 0.51945*height))
        path.addCurve(to: CGPoint(x: 0.67623*width, y: 0.51181*height), control1: CGPoint(x: 0.6689*width, y: 0.51801*height), control2: CGPoint(x: 0.67321*width, y: 0.51554*height))
        path.addLine(to: CGPoint(x: 0.99577*width, y: 0.11623*height))
        path.addCurve(to: CGPoint(x: width, y: 0.10415*height), control1: CGPoint(x: 0.99852*width, y: 0.11281*height), control2: CGPoint(x: 1.00001*width, y: 0.10854*height))
        path.addLine(to: CGPoint(x: width, y: 0.07692*height))
        path.addCurve(to: CGPoint(x: 0.97747*width, y: 0.02253*height), control1: CGPoint(x: width, y: 0.05652*height), control2: CGPoint(x: 0.9919*width, y: 0.03696*height))
        path.addCurve(to: CGPoint(x: 0.92308*width, y: 0), control1: CGPoint(x: 0.96304*width, y: 0.0081*height), control2: CGPoint(x: 0.94348*width, y: 0))
        path.addLine(to: CGPoint(x: 0.07692*width, y: 0))
        path.closeSubpath()
        path.move(to: CGPoint(x: width, y: 0.28777*height))
        path.addCurve(to: CGPoint(x: 0.99647*width, y: 0.27667*height), control1: CGPoint(x: width, y: 0.28379*height), control2: CGPoint(x: 0.99877*width, y: 0.27991*height))
        path.addCurve(to: CGPoint(x: 0.98717*width, y: 0.26964*height), control1: CGPoint(x: 0.99417*width, y: 0.27342*height), control2: CGPoint(x: 0.99092*width, y: 0.27097*height))
        path.addCurve(to: CGPoint(x: 0.97553*width, y: 0.26927*height), control1: CGPoint(x: 0.98342*width, y: 0.26832*height), control2: CGPoint(x: 0.97936*width, y: 0.26819*height))
        path.addCurve(to: CGPoint(x: 0.96581*width, y: 0.27569*height), control1: CGPoint(x: 0.9717*width, y: 0.27036*height), control2: CGPoint(x: 0.96831*width, y: 0.2726*height))
        path.addLine(to: CGPoint(x: 0.71581*width, y: 0.58523*height))
        path.addCurve(to: CGPoint(x: 0.71154*width, y: 0.59731*height), control1: CGPoint(x: 0.71304*width, y: 0.58865*height), control2: CGPoint(x: 0.71154*width, y: 0.59291*height))
        path.addLine(to: CGPoint(x: 0.71154*width, y: 0.98077*height))
        path.addCurve(to: CGPoint(x: 0.71717*width, y: 0.99437*height), control1: CGPoint(x: 0.71154*width, y: 0.98587*height), control2: CGPoint(x: 0.71357*width, y: 0.99076*height))
        path.addCurve(to: CGPoint(x: 0.73077*width, y: height), control1: CGPoint(x: 0.72078*width, y: 0.99798*height), control2: CGPoint(x: 0.72567*width, y: height))
        path.addLine(to: CGPoint(x: 0.92308*width, y: height))
        path.addCurve(to: CGPoint(x: 0.97747*width, y: 0.97747*height), control1: CGPoint(x: 0.94348*width, y: height), control2: CGPoint(x: 0.96304*width, y: 0.9919*height))
        path.addCurve(to: CGPoint(x: width, y: 0.92308*height), control1: CGPoint(x: 0.9919*width, y: 0.96304*height), control2: CGPoint(x: width, y: 0.94348*height))
        path.addLine(to: CGPoint(x: width, y: 0.28777*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.61539*width, y: height))
        path.addCurve(to: CGPoint(x: 0.62898*width, y: 0.99437*height), control1: CGPoint(x: 0.62049*width, y: height), control2: CGPoint(x: 0.62538*width, y: 0.99798*height))
        path.addCurve(to: CGPoint(x: 0.63461*width, y: 0.98077*height), control1: CGPoint(x: 0.63259*width, y: 0.99076*height), control2: CGPoint(x: 0.63461*width, y: 0.98587*height))
        path.addLine(to: CGPoint(x: 0.63461*width, y: 0.60781*height))
        path.addCurve(to: CGPoint(x: 0.63233*width, y: 0.59873*height), control1: CGPoint(x: 0.63461*width, y: 0.60464*height), control2: CGPoint(x: 0.63383*width, y: 0.60152*height))
        path.addCurve(to: CGPoint(x: 0.62604*width, y: 0.59181*height), control1: CGPoint(x: 0.63084*width, y: 0.59594*height), control2: CGPoint(x: 0.62868*width, y: 0.59356*height))
        path.addLine(to: CGPoint(x: 0.39527*width, y: 0.43796*height))
        path.addCurve(to: CGPoint(x: 0.38553*width, y: 0.43476*height), control1: CGPoint(x: 0.39237*width, y: 0.43604*height), control2: CGPoint(x: 0.38901*width, y: 0.43493*height))
        path.addCurve(to: CGPoint(x: 0.37554*width, y: 0.43702*height), control1: CGPoint(x: 0.38206*width, y: 0.4346*height), control2: CGPoint(x: 0.3786*width, y: 0.43538*height))
        path.addCurve(to: CGPoint(x: 0.36812*width, y: 0.44409*height), control1: CGPoint(x: 0.37247*width, y: 0.43866*height), control2: CGPoint(x: 0.36991*width, y: 0.4411*height))
        path.addCurve(to: CGPoint(x: 0.36539*width, y: 0.45396*height), control1: CGPoint(x: 0.36633*width, y: 0.44707*height), control2: CGPoint(x: 0.36539*width, y: 0.45048*height))
        path.addLine(to: CGPoint(x: 0.36539*width, y: 0.98077*height))
        path.addCurve(to: CGPoint(x: 0.37102*width, y: 0.99437*height), control1: CGPoint(x: 0.36539*width, y: 0.98587*height), control2: CGPoint(x: 0.36741*width, y: 0.99076*height))
        path.addCurve(to: CGPoint(x: 0.38461*width, y: height), control1: CGPoint(x: 0.37462*width, y: 0.99798*height), control2: CGPoint(x: 0.37951*width, y: height))
        path.addLine(to: CGPoint(x: 0.61539*width, y: height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.26923*width, y: height))
        path.addCurve(to: CGPoint(x: 0.28283*width, y: 0.99437*height), control1: CGPoint(x: 0.27433*width, y: height), control2: CGPoint(x: 0.27922*width, y: 0.99798*height))
        path.addCurve(to: CGPoint(x: 0.28846*width, y: 0.98077*height), control1: CGPoint(x: 0.28644*width, y: 0.99076*height), control2: CGPoint(x: 0.28846*width, y: 0.98587*height))
        path.addLine(to: CGPoint(x: 0.28846*width, y: 0.48077*height))
        path.addCurve(to: CGPoint(x: 0.28529*width, y: 0.47018*height), control1: CGPoint(x: 0.28846*width, y: 0.477*height), control2: CGPoint(x: 0.28736*width, y: 0.47332*height))
        path.addCurve(to: CGPoint(x: 0.2768*width, y: 0.46309*height), control1: CGPoint(x: 0.28321*width, y: 0.46704*height), control2: CGPoint(x: 0.28026*width, y: 0.46457*height))
        path.addCurve(to: CGPoint(x: 0.26582*width, y: 0.46184*height), control1: CGPoint(x: 0.27334*width, y: 0.46161*height), control2: CGPoint(x: 0.26952*width, y: 0.46117*height))
        path.addCurve(to: CGPoint(x: 0.25596*width, y: 0.46685*height), control1: CGPoint(x: 0.26211*width, y: 0.46251*height), control2: CGPoint(x: 0.25869*width, y: 0.46425*height))
        path.addLine(to: CGPoint(x: 0.00596*width, y: 0.70492*height))
        path.addCurve(to: CGPoint(x: 0.00154*width, y: 0.71129*height), control1: CGPoint(x: 0.00407*width, y: 0.70672*height), control2: CGPoint(x: 0.00257*width, y: 0.70889*height))
        path.addCurve(to: CGPoint(x: 0, y: 0.71889*height), control1: CGPoint(x: 0.00052*width, y: 0.71369*height), control2: CGPoint(x: -0.00001*width, y: 0.71628*height))
        path.addLine(to: CGPoint(x: 0, y: 0.92308*height))
        path.addCurve(to: CGPoint(x: 0.02253*width, y: 0.97747*height), control1: CGPoint(x: 0, y: 0.94348*height), control2: CGPoint(x: 0.0081*width, y: 0.96304*height))
        path.addCurve(to: CGPoint(x: 0.07692*width, y: height), control1: CGPoint(x: 0.03696*width, y: 0.9919*height), control2: CGPoint(x: 0.05652*width, y: height))
        path.addLine(to: CGPoint(x: 0.26923*width, y: height))
        path.closeSubpath()
        return path
    }
}

struct DataShape_Previews: PreviewProvider {
    static var previews: some View {
        DataShape()
    }
}
