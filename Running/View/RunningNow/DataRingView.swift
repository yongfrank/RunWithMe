//
//  DataRingView.swift
//  Running
//
//  Created by Frank Chu on 8/30/22.
//

import SwiftUI

struct DataRingView: View {
    
    let bgColor = Color(hex: "9F9F9F")
    let percentage = 70
    
    var body: some View {
        ZStack {
            Ring(
                lineWidth: 10,
                backgroundColor: bgColor,
                foregroundColor: .blue,
                percentage: percentage,
                textColor: .black
            )
            .frame(width: 70, height: 70)
        }
    }
}

struct DataRingView_Previews: PreviewProvider {
    static var previews: some View {
        DataRingView()
    }
}

struct Ring: View {
    let lineWidth: CGFloat
    let backgroundColor: Color
    let foregroundColor: Color
    let textColor: Color
    
    @State private var changedPercentage = 0.0
    var percentage: Double = 0.0
    init(lineWidth: CGFloat, backgroundColor: Color, foregroundColor: Color, percentage: Int, textColor: Color) {
        self.lineWidth = lineWidth
        self.backgroundColor = backgroundColor
        self.foregroundColor = foregroundColor
        self.percentage = Double(percentage)
        self.textColor = textColor
    }
    
    var body: some View {
//        GeometryReader { geo in
            ZStack {
                // Track
                RingShape()
                    .stroke(style: StrokeStyle(lineWidth: lineWidth))
                    .fill(backgroundColor)
                
                // Animated Ring
                RingShape(percent: changedPercentage)
                    .stroke(style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                    .fill(foregroundColor)
                
                Text("\(Int(percentage))%")
                    .fontWeight(.bold)
                    .foregroundColor(textColor)
//                    .font(.system(.largeTitle, design: .rounded))
            }
            .padding(lineWidth / 2)
//        }
        .animation(Animation.easeOut(duration: 1), value: changedPercentage)
        .onAppear {
            self.changedPercentage = self.percentage
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("百分之\(Int(self.percentage))")
    }
}

struct RingShape: Shape {
    
    var percent: Double
    let startAngle: Double
    
//    typealias AnimatableData = Double
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    
    init(
        percent: Double = 100,
        startAngle: Double = -90
    ) {
        self.percent = percent
        self.startAngle = startAngle
    }
    
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let radius = min(height, width) / 2
        let center = CGPoint(x: width / 2, y: height / 2)
        let endAngle = Self.percentToAngle(percent: self.percent, startAngle: self.startAngle)
        
        return Path { path in
            path.addArc(
                center: center,
                radius: radius,
                startAngle: Angle(degrees: self.startAngle),
                endAngle: Angle(degrees: endAngle),
                clockwise: false
            )
        }
    }
    
    static func percentToAngle(percent: Double, startAngle: Double) -> Double {
        return (percent / 100 * 360) + startAngle
    }
}
