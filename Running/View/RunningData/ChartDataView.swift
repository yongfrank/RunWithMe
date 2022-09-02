//
//  ChartDataView.swift
//  Running
//
//  Created by Frank Chu on 8/31/22.
//

import SwiftUI

struct ChartDataView: View {
    
    let contentType: RunningDataModel.DataDisplay
    let ringPercent: Int
    
    @EnvironmentObject private var runDataVM: RunningDataViewModel
    @EnvironmentObject private var vm: MainPageViewMode
    var body: some View {
        VStack {
            HStack {
                TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: vm.currentChoosedHelper, sizeOfProfile: 50, displayWithName: false)
                    .padding(.horizontal, 30)
                
                VStack(alignment: .leading) {
                    Text("与\(vm.currentChoosedHelper?.username ?? "加载中")")
                        .foregroundColor(Color(hex: "DF1876"))
                        .font(.title2)
                        .bold()
                        .padding(.bottom, 1)
                    Group {
                        Text("陪跑\(Int.random(in: 30..<120))次")
                        Text("\(Calendar.current.date(byAdding: .day, value: -Int.random(in: 365..<720),to: Date())!.formatted(date: .abbreviated, time: .omitted))至\(Date().formatted(date: .abbreviated, time: .omitted))")
                    }
                    .font(.caption2)
                }
                .accessibilityElement(children: .combine)
                Ring(
                    lineWidth: 10,
                    backgroundColor: Color(hex: "9F9F9F"),
                    foregroundColor: Color(hex: "DF1876"),
                    percentage: ringPercent,
                    textColor: Color(hex: "DF1876")
                )
                .frame(width: 70, height: 70)
            }
            
            ForEach(runDataVM.typeOfTimeDisplayData.indices, id: \.self) { index in
                ChartView(smallSection: runDataVM.typeOfTimeDisplayData[index], data: generateData(type: runDataVM.typeOfTimeDisplayData[index].typeOfTimeOptions))
            }
            .padding(.horizontal)
            
        }
        .padding()
        .navigationTitle(String(runDataVM.returnTextTitle(dataType: contentType)))
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChartDataView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone 13 mini", "iPhone SE (3rd generation)", "iPhone 13 Pro Max"], id: \.self) { model in
            NavigationView {
                ChartDataView(contentType: .runningVerticalOscillation, ringPercent: Int.random(in: 70..<90))
                
            }
            .environmentObject(RunningDataViewModel())
            .environmentObject(MainPageViewMode())
            .environmentObject(StateOfSomething())
            .previewDevice(PreviewDevice(rawValue: model))
        }
        
    }
}
