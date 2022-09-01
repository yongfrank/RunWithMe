//
//  RunningData.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct RunningDataResultView: View {
    @EnvironmentObject var state: StateOfSomething
    @EnvironmentObject var vm: RunningDataViewModel
    
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
            
            Text("步频配合")
                .fontWeight(.semibold)
                .padding(.leading, 5)
            ZStack {
                backgroundDark()
                HStack(alignment: .center) {
                    Ring(lineWidth: 10, backgroundColor: Color(hex: "9F9F9F"), foregroundColor: .indigo, percentage: vm.data.dataDisplay[.paceFrequency]!, textColor: .white)
                        .frame(width: 70, height: 70)
                    Text(vm.data.rateWords[0])
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 100)
            Text("配速配合")
                .fontWeight(.semibold)
                .padding(.leading, 5)
            ZStack {
                backgroundDark()
                HStack(alignment: .center) {
                    Ring(lineWidth: 10, backgroundColor: Color(hex: "9F9F9F"), foregroundColor: .blue, percentage: vm.data.dataDisplay[.speedVariation]!, textColor: .white)
                        .frame(width: 70, height: 70)
                    Text(vm.data.rateWords[1])
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 100)
            Text("姿势数据")
                .fontWeight(.semibold)
                .padding(.leading, 5)
            ZStack {
                backgroundDark()
                HStack(alignment: .center) {
                    Ring(lineWidth: 10, backgroundColor: Color(hex: "9F9F9F"), foregroundColor: .yellow, percentage: vm.data.dataDisplay[.runningPosture]!, textColor: .white)
                        .frame(width: 70, height: 70)
                    Text(vm.data.rateWords[2])
                        .foregroundColor(.white)
                        .padding(.leading, 10)
                }
                .padding(.horizontal)
            }
            .frame(maxHeight: 100)
            Button {
                // Change Page to RunningData
//                state.buttonState = "DataResult"
                state.isInRunningView = false
                state.selectedIndex = 1
                state.buttonState = "Pause"
            } label: {
                DetailedView.shared.redDoneButton()
            }
            .padding(.vertical)
        }
        .padding(.horizontal, 25)
    }
    
    func backgroundDark(height: CGFloat? = 0) -> some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(#colorLiteral(red: 0.32499998807907104, green: 0.32499998807907104, blue: 0.32499998807907104, alpha: 1))
            )
        //            .frame(idealWidth: 50)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
    }
}

struct RunningData_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE (3rd generation)", "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro Max"], id: \.self) { model in
            RunningDataResultView()
                .environmentObject(StateOfSomething())
                .environmentObject(RunningDataViewModel())
                .previewDevice(PreviewDevice(rawValue: model))
        }
    }
}
