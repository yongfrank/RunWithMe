//
//  RunningMan.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct RunningManShape: View {
    var body: some View {
        ShapeRunningMan()
            .frame(width: 28, height: 32)
//            .foregroundColor(Color(hex: 0x535353))
//            .foregroundColor(Color(hex: 0xDF1878))
    }
}
struct ShapeRunningMan: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.93796*width, y: 0.46245*height))
        path.addCurve(to: CGPoint(x: 0.72744*width, y: 0.50439*height), control1: CGPoint(x: 0.93796*width, y: 0.46245*height), control2: CGPoint(x: 0.77308*width, y: 0.49354*height))
        path.addCurve(to: CGPoint(x: 0.61119*width, y: 0.43381*height), control1: CGPoint(x: 0.68224*width, y: 0.51524*height), control2: CGPoint(x: 0.62621*width, y: 0.43664*height))
        path.addCurve(to: CGPoint(x: 0.55195*width, y: 0.57987*height), control1: CGPoint(x: 0.60157*width, y: 0.45844*height), control2: CGPoint(x: 0.57052*width, y: 0.53079*height))
        path.addCurve(to: CGPoint(x: 0.73518*width, y: 0.64234*height), control1: CGPoint(x: 0.58069*width, y: 0.57908*height), control2: CGPoint(x: 0.72976*width, y: 0.61907*height))
        path.addCurve(to: CGPoint(x: 0.81099*width, y: 0.92107*height), control1: CGPoint(x: 0.74136*width, y: 0.6659*height), control2: CGPoint(x: 0.81099*width, y: 0.92107*height))
        path.addCurve(to: CGPoint(x: 0.75673*width, y: 0.99596*height), control1: CGPoint(x: 0.81099*width, y: 0.92107*height), control2: CGPoint(x: 0.84049*width, y: 0.97592*height))
        path.addCurve(to: CGPoint(x: 0.66909*width, y: 0.95499*height), control1: CGPoint(x: 0.67285*width, y: 1.016*height), control2: CGPoint(x: 0.66909*width, y: 0.95499*height))
        path.addCurve(to: CGPoint(x: 0.60533*width, y: 0.74744*height), control1: CGPoint(x: 0.66909*width, y: 0.95499*height), control2: CGPoint(x: 0.61052*width, y: 0.75927*height))
        path.addCurve(to: CGPoint(x: 0.46631*width, y: 0.72172*height), control1: CGPoint(x: 0.60046*width, y: 0.73561*height), control2: CGPoint(x: 0.49128*width, y: 0.71576*height))
        path.addCurve(to: CGPoint(x: 0.33392*width, y: 0.90621*height), control1: CGPoint(x: 0.44111*width, y: 0.72779*height), control2: CGPoint(x: 0.38718*width, y: 0.89487*height))
        path.addCurve(to: CGPoint(x: 0.06516*width, y: 0.81323*height), control1: CGPoint(x: 0.26551*width, y: 0.92087*height), control2: CGPoint(x: 0.06516*width, y: 0.81323*height))
        path.addCurve(to: CGPoint(x: 0.00217*width, y: 0.73023*height), control1: CGPoint(x: 0.06516*width, y: 0.81323*height), control2: CGPoint(x: -0.01396*width, y: 0.79593*height))
        path.addCurve(to: CGPoint(x: 0.09544*width, y: 0.68282*height), control1: CGPoint(x: 0.01864*width, y: 0.66502*height), control2: CGPoint(x: 0.09544*width, y: 0.68282*height))
        path.addCurve(to: CGPoint(x: 0.25369*width, y: 0.74372*height), control1: CGPoint(x: 0.09544*width, y: 0.68282*height), control2: CGPoint(x: 0.23733*width, y: 0.75184*height))
        path.addCurve(to: CGPoint(x: 0.30386*width, y: 0.64175*height), control1: CGPoint(x: 0.27027*width, y: 0.73551*height), control2: CGPoint(x: 0.27966*width, y: 0.6879*height))
        path.addCurve(to: CGPoint(x: 0.36055*width, y: 0.48601*height), control1: CGPoint(x: 0.30485*width, y: 0.62435*height), control2: CGPoint(x: 0.36055*width, y: 0.48601*height))
        path.addCurve(to: CGPoint(x: 0.37912*width, y: 0.38815*height), control1: CGPoint(x: 0.36055*width, y: 0.48601*height), control2: CGPoint(x: 0.39138*width, y: 0.39392*height))
        path.addCurve(to: CGPoint(x: 0.33524*width, y: 0.41122*height), control1: CGPoint(x: 0.36221*width, y: 0.38023*height), control2: CGPoint(x: 0.34453*width, y: 0.39714*height))
        path.addCurve(to: CGPoint(x: 0.22761*width, y: 0.55777*height), control1: CGPoint(x: 0.32596*width, y: 0.4252*height), control2: CGPoint(x: 0.28916*width, y: 0.48279*height))
        path.addCurve(to: CGPoint(x: 0.11588*width, y: 0.50019*height), control1: CGPoint(x: 0.17291*width, y: 0.62455*height), control2: CGPoint(x: 0.07533*width, y: 0.56256*height))
        path.addCurve(to: CGPoint(x: 0.30386*width, y: 0.27191*height), control1: CGPoint(x: 0.14959*width, y: 0.44827*height), control2: CGPoint(x: 0.23932*width, y: 0.29987*height))
        path.addCurve(to: CGPoint(x: 0.57626*width, y: 0.24786*height), control1: CGPoint(x: 0.36884*width, y: 0.24375*height), control2: CGPoint(x: 0.4809*width, y: 0.22811*height))
        path.addCurve(to: CGPoint(x: 0.75805*width, y: 0.37593*height), control1: CGPoint(x: 0.67208*width, y: 0.26721*height), control2: CGPoint(x: 0.73926*width, y: 0.36322*height))
        path.addCurve(to: CGPoint(x: 0.90547*width, y: 0.35119*height), control1: CGPoint(x: 0.7764*width, y: 0.38815*height), control2: CGPoint(x: 0.90547*width, y: 0.35119*height))
        path.addCurve(to: CGPoint(x: 0.99719*width, y: 0.38795*height), control1: CGPoint(x: 0.90547*width, y: 0.35119*height), control2: CGPoint(x: 0.97896*width, y: 0.32861*height))
        path.addCurve(to: CGPoint(x: 0.93796*width, y: 0.46245*height), control1: CGPoint(x: 1.01554*width, y: 0.44769*height), control2: CGPoint(x: 0.93796*width, y: 0.46245*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.63605*width, y: 0.21784*height))
        path.addCurve(to: CGPoint(x: 0.48145*width, y: 0.14012*height), control1: CGPoint(x: 0.56842*width, y: 0.23407*height), control2: CGPoint(x: 0.49957*width, y: 0.19936*height))
        path.addCurve(to: CGPoint(x: 0.57052*width, y: 0.00393*height), control1: CGPoint(x: 0.46344*width, y: 0.08117*height), control2: CGPoint(x: 0.50289*width, y: 0.02016*height))
        path.addCurve(to: CGPoint(x: 0.72512*width, y: 0.08175*height), control1: CGPoint(x: 0.63804*width, y: -0.0122*height), control2: CGPoint(x: 0.70711*width, y: 0.0228*height))
        path.addCurve(to: CGPoint(x: 0.63605*width, y: 0.21784*height), control1: CGPoint(x: 0.74335*width, y: 0.141*height), control2: CGPoint(x: 0.70346*width, y: 0.20161*height))
        path.closeSubpath()
        return path
    }
}

struct RunningMan_Previews: PreviewProvider {
    static var previews: some View {
        RunningManShape()
    }
}

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
