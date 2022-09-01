//
//  RunningDataRingView.swift
//  Running
//
//  Created by Frank Chu on 8/30/22.
//

import SwiftUI

struct RunningDataRingView: View {
    @EnvironmentObject var state: StateOfSomething
    @EnvironmentObject var vm: RunningDataViewModel
    
    //    @State private var textDisplay: [RunningDataModel.DataDisplay: String] = [.paceFrequency : "步频配合", .runningStrideLength : "步长数据", .speedVariation : "变速配合", .runningGroundContactTime: "触地时间", .runningPosture: "姿势数据", .runningVerticalOscillation : "垂直振幅"]
    
    let color: [Color] = [.indigo, .indigo, .blue, .blue, .yellow, .yellow]
    
    let columns: [GridItem] = [GridItem(.flexible(minimum: 80)), GridItem(.flexible(minimum: 80))]
    let stringOfRing: [String] = ["步频配合", "步长数据", "变速配合", "触地时间", "姿势数据", "垂直振幅"]
    let categoryOfRing: [RunningDataModel.DataDisplay] = [.paceFrequency, .runningStrideLength, .speedVariation, .runningGroundContactTime, .runningPosture, .runningVerticalOscillation]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("本次跑步数据")
                .font(.title)
                .fontWeight(.bold)
                .padding(.vertical)
            ZStack {
                backgroundDark()
                    .frame(height: 170)
                VStack {
                    HStack {
                        TimeDataDetailed()
                        Spacer()
                        DistaceDetailed()
                    }
                    HStack {
                        AveragedSpeed()
                        Spacer()
                        HeartRateDetailed()
                    }
                }
                .padding(.horizontal)
            }
            .frame(idealHeight: 150)
            LazyVGrid(columns: columns) {
                ForEach(0..<6, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(String(stringOfRing[index]))
                        HStack {
                            Ring(lineWidth: 10, backgroundColor: Color(hex: "9F9F9F"), foregroundColor: color[index], percentage: vm.data.dataDisplay[categoryOfRing[index]]!, textColor: .black)
                                .frame(width: 70, height: 70)
                            if Bool.random() {
                                ArrowUp()
                                    .frame(width: 20, height: 30)
                                    .foregroundColor(Color(hex: "DF1876"))
                            } else {
                                ArrowDown()
                                    .frame(width: 20, height: 30)
                                    .foregroundColor(Color(hex: "DF1876"))
                            }
                        }
                    }
                }
            }
            .padding(.vertical)
            
            Button {
                state.isInRunningView = false
                state.selectedIndex = 1
                state.buttonState = "Pause"
            } label: {
                DetailedView.shared.redDoneButton()
            }
            .padding(.vertical)
        }
        .padding(.horizontal, 25)
        .padding(.bottom)
    }
    
    func backgroundDark(height: CGFloat? = 0) -> some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(#colorLiteral(red: 0.32499998807907104, green: 0.32499998807907104, blue: 0.32499998807907104, alpha: 1)))
        //            .frame(idealWidth: 50)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
    }
}

struct RunningDataRingView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro Max"], id: \.self) { model in
            RunningDataRingView()
                .environmentObject(StateOfSomething())
                .environmentObject(RunningDataViewModel())
                .previewDevice(PreviewDevice(rawValue: model))
        }
    }
}

struct ArrowUp: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.5442*width, y: 0.02684*height))
        path.addCurve(to: CGPoint(x: 0.4558*width, y: 0.02684*height), control1: CGPoint(x: 0.51979*width, y: 0.0101*height), control2: CGPoint(x: 0.48021*width, y: 0.0101*height))
        path.addLine(to: CGPoint(x: 0.05806*width, y: 0.29958*height))
        path.addCurve(to: CGPoint(x: 0.05806*width, y: 0.36019*height), control1: CGPoint(x: 0.03365*width, y: 0.31632*height), control2: CGPoint(x: 0.03365*width, y: 0.34345*height))
        path.addCurve(to: CGPoint(x: 0.14645*width, y: 0.36019*height), control1: CGPoint(x: 0.08247*width, y: 0.37693*height), control2: CGPoint(x: 0.12204*width, y: 0.37693*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.11775*height))
        path.addLine(to: CGPoint(x: 0.85355*width, y: 0.36019*height))
        path.addCurve(to: CGPoint(x: 0.94194*width, y: 0.36019*height), control1: CGPoint(x: 0.87796*width, y: 0.37693*height), control2: CGPoint(x: 0.91753*width, y: 0.37693*height))
        path.addCurve(to: CGPoint(x: 0.94194*width, y: 0.29958*height), control1: CGPoint(x: 0.96635*width, y: 0.34345*height), control2: CGPoint(x: 0.96635*width, y: 0.31632*height))
        path.addLine(to: CGPoint(x: 0.5442*width, y: 0.02684*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.4375*width, y: 0.05714*height))
        path.addLine(to: CGPoint(x: 0.4375*width, y: height))
        path.addLine(to: CGPoint(x: 0.5625*width, y: height))
        path.addLine(to: CGPoint(x: 0.5625*width, y: 0.05714*height))
        path.addLine(to: CGPoint(x: 0.4375*width, y: 0.05714*height))
        path.closeSubpath()
        return path
    }
}

struct ArrowDown: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.4558*width, y: 0.97528*height))
        path.addCurve(to: CGPoint(x: 0.5442*width, y: 0.97528*height), control1: CGPoint(x: 0.48021*width, y: 0.99069*height), control2: CGPoint(x: 0.51979*width, y: 0.99069*height))
        path.addLine(to: CGPoint(x: 0.94194*width, y: 0.72407*height))
        path.addCurve(to: CGPoint(x: 0.94194*width, y: 0.66825*height), control1: CGPoint(x: 0.96635*width, y: 0.70866*height), control2: CGPoint(x: 0.96635*width, y: 0.68366*height))
        path.addCurve(to: CGPoint(x: 0.85355*width, y: 0.66825*height), control1: CGPoint(x: 0.91753*width, y: 0.65283*height), control2: CGPoint(x: 0.87796*width, y: 0.65283*height))
        path.addLine(to: CGPoint(x: 0.5*width, y: 0.89154*height))
        path.addLine(to: CGPoint(x: 0.14645*width, y: 0.66825*height))
        path.addCurve(to: CGPoint(x: 0.05806*width, y: 0.66825*height), control1: CGPoint(x: 0.12204*width, y: 0.65283*height), control2: CGPoint(x: 0.08247*width, y: 0.65283*height))
        path.addCurve(to: CGPoint(x: 0.05806*width, y: 0.72407*height), control1: CGPoint(x: 0.03365*width, y: 0.68366*height), control2: CGPoint(x: 0.03365*width, y: 0.70866*height))
        path.addLine(to: CGPoint(x: 0.4558*width, y: 0.97528*height))
        path.closeSubpath()
        path.move(to: CGPoint(x: 0.4375*width, y: 0))
        path.addLine(to: CGPoint(x: 0.4375*width, y: 0.94737*height))
        path.addLine(to: CGPoint(x: 0.5625*width, y: 0.94737*height))
        path.addLine(to: CGPoint(x: 0.5625*width, y: 0))
        path.addLine(to: CGPoint(x: 0.4375*width, y: 0))
        path.closeSubpath()
        return path
    }
}
