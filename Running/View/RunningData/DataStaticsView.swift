//
//  Data.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct DataStaticsView: View {
    @EnvironmentObject var vm: MainPageViewMode
    @EnvironmentObject var runDataVM: RunningDataViewModel
    
    let columns = [GridItem(.flexible(maximum: 180)), GridItem(.flexible(maximum: 180))]
    
    let color = [Color(hex: "FF5D08"), Color(hex: "EBB565"), Color(hex: "F68484"), Color(hex: "874DD8")]
    let categoryData: [RunningDataModel.DataDisplay] = [.runningStrideLength, .runningGroundContactTime, .runningPosture, .runningVerticalOscillation]
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    if vm.users != [] {
                        let users = vm.filteredNoHelplerAndNoSelf()
                        ForEach(0..<3, id: \.self) { index in
                            Button {
                                vm.choosedWithHelper(with: index == 1 ? vm.currentChoosedHelper : users[index])
                                if index != 1 {
                                    runDataVM.refreshRunningData()
                                }
                            } label: {
                                TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: index == 1 ? vm.currentChoosedHelper : users[index], sizeOfProfile: index == 1 ? 70 : 50)
                                    .padding(.horizontal, index == 1 ? 10 : 31)
                                    .accessibilityElement(children: .combine)
                                    .accessibilityHint(index == 1 ? "当前查看该陪跑员数据" : "选择以查询该陪跑员数据")
                            }
                        }
//                        TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: users[0], sizeOfProfile: 50)
//                            .padding(.horizontal, 10)
//                        TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: users[1], sizeOfProfile: 70)
//                            .padding(.horizontal, 30)
//                        TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: users[2], sizeOfProfile: 50)
//                            .padding(.horizontal, 10)
                        
                    } else {
                        TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: nil, sizeOfProfile: 50)
                            .padding(.horizontal, 10)
                        TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: nil, sizeOfProfile: 70)
                            .padding(.horizontal, 30)
                        TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: nil, sizeOfProfile: 50)
                            .padding(.horizontal, 10)
                    }
                }
                HStack {
                    Text("全部数据")
                        .fontWeight(.semibold)
                        .offset(y: -5)
                        .padding(.vertical, 0)
                        .padding(.horizontal, 30)
                    Spacer()
                }
                LazyVGrid(columns: columns) {
                    ForEach(0..<4) { index in
                        NavigationLink {
                            ChartDataView(contentType: categoryData[index], ringPercent: runDataVM.data.dataDisplay[categoryData[index]] ?? 0)
                        } label: {
                            RectanglePieShapeView(
                                backgroundColor: color[index],
                                percent: runDataVM.data.dataDisplay[categoryData[index]] ?? 0, displayData: categoryData[index]
                            )
                            .frame(maxWidth: 100)
                            .frame(maxHeight: 230)
                            .accessibilityHint("选择以查看消息数据")
                        }
                    }
                }
            }
            .padding(.bottom)
            .navigationBarHidden(true)
        }
    }
}

struct Data_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone 13 mini", "iPhone SE (3rd generation)", "iPhone 13 Pro Max"], id: \.self) { model in
            ContentView()
                .environmentObject(StateOfSomething())
                .environmentObject(MainPageViewMode())
                .environmentObject(RunningDataViewModel())
                .previewDevice(PreviewDevice(rawValue: model))
        }
    }
}
