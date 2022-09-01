//
//  RectanglePieShapeView.swift
//  Running
//
//  Created by Frank Chu on 8/30/22.
//

import SwiftUI

struct Test: View {
    @State private var percent = 90
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    
                } label: {
                    RectanglePieShapeView(backgroundColor: .red, percent: percent, displayData: .runningVerticalOscillation)
                }
                Button {
                    self.percent = Int.random(in: 0..<100)
                } label: {
                    Text("Random")
                }
            }
        }
    }
}

struct RectangleView_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}


struct RectanglePieShapeView: View {
    let backgroundColor: Color
    let percent: Int
    @State private var animatedPercentage = 0
    
    let displayData: RunningDataModel.DataDisplay
    
    private let textDisplay: [RunningDataModel.DataDisplay: String] = [.paceFrequency : "步频配合", .runningStrideLength : "步长数据", .speedVariation : "变速配合", .runningGroundContactTime: "触地时间", .runningPosture: "姿势数据", .runningVerticalOscillation : "垂直振幅"]
    @EnvironmentObject private var vm: RunningDataViewModel
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(backgroundColor)
                    .frame(width: 150, height: 144)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15)), radius: 4, x: 0, y: 4)
                
                ZStack {
                    PieShapeView(percent: Double(self.animatedPercentage))
                        .fill(
                            Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5))
                        )
                    
                    Circle()
                        .strokeBorder(LinearGradient(
                            gradient: Gradient(stops: [
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0),
                                .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)), location: 1)]
                            ),
                            startPoint: UnitPoint(x: 0.5, y: -3),
                            endPoint: UnitPoint(x: 0.5, y: 1))
                                      , lineWidth: 1
                        )
                }
                .frame(width: 203, height: 203)
                
            }
            .animation(Animation.easeOut(duration: 1), value: animatedPercentage)
            .onAppear {
                self.animatedPercentage = self.percent
            }
            .onChange(of: self.percent) { newValue in
//                self.animatedPercentage = self.percent
                self.animatedPercentage = newValue
            }
            VStack(alignment: .leading) {
                Text(textDisplay[displayData] ?? "加载中")
                Text("\(percent)%")
                    .font(.title)
                    .fontWeight(.semibold)
            }
            .offset(x: -30, y: -20)
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(textDisplay[displayData] ?? "加载中")，配合度百分之\(Int(percent))")
        
    }
}

struct PieShapeView: Shape {
    var percent: Double
    var animatableData: Double {
        get {
            return percent
        }
        set {
            percent = newValue
        }
    }
    init(percent: Double) {
        self.percent = percent
    }
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let radius = min(rect.width, rect.height) / 2
        let endAngle = Self.percentToAngle(percent: self.percent)
        return Path { path in
            path.move(to: center)
            path.addArc(
                center: center,
                radius: radius,
                startAngle: .zero,
                endAngle: Angle(degrees: endAngle),
                clockwise: false)
        }
    }
    
    static func percentToAngle(percent: Double) -> Double {
        return percent / 100 * 360
    }
}

