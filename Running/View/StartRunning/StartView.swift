//
//  Start.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct StartView: View {
    //    @State var peopleSide = true
    @State var footSide = true
    //    @State var speed = 300.0
//    @State var vibrationNavigation = true
//    @State var specialAudio = true
    @EnvironmentObject var state: StateOfSomething
    @EnvironmentObject var vm: MainPageViewMode
    @EnvironmentObject var runData: RunningDataViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                topBarImage
                    .frame(height: 110)
                buttonCollection
            }
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    var topBarImage: some View {
        HStack {
            if vm.users != [] {
                let users = vm.filteredNoHelplerAndNoSelf()
                
                ForEach(0..<3, id: \.self) { index in
                    Button {
                        vm.choosedWithHelper(with: index == 1 ? vm.currentChoosedHelper : users[index])
                    } label: {
                        DetailedView.avaterDisplay(user: index == 1 ? vm.currentChoosedHelper : users[index], sizeOfProfile: index == 1 ? 76 : 60)
                            .padding(.horizontal, index == 1 ? 5 : 21)
                            .accessibilityElement(children: .combine)
                            .accessibilityHint(index == 1 ? "当前选定为陪跑员" : "可以选择为陪跑员，当前陪跑员是\(vm.currentChoosedHelper?.username ?? "加载中")")
                    }
                }
//                Button {
//
//                } label: {
//                    DetailedView.avaterDisplay(user: users[0], sizeOfProfile: 60)
//                        .padding(.horizontal, 21)
//                        .accessibilityElement(children: .combine)
//                }
//                Button {
//
//                } label: {
//                    DetailedView.avaterDisplay(user: users[1], sizeOfProfile: 76)
//                        .padding(.bottom, 5)
//                        .accessibilityElement(children: .combine)
//                }
//
//                DetailedView.avaterDisplay(user: users[2], sizeOfProfile: 60)
//                    .padding(.horizontal, 21)
//                    .accessibilityElement(children: .combine)
            } else {
                DetailedView.avaterDisplay(user: nil, sizeOfProfile: 60)
                    .padding(.horizontal, 21)
                    .accessibilityElement(children: .combine)
                DetailedView.avaterDisplay(user: nil, sizeOfProfile: 76)
                    .padding(.bottom, 5)
                    .accessibilityElement(children: .combine)
                DetailedView.avaterDisplay(user: nil, sizeOfProfile: 60)
                    .padding(.horizontal, 21)
                    .accessibilityElement(children: .combine)
            }
        }
    }
    
    var buttonCollection: some View {
        VStack(alignment: .leading) {
                Text("陪跑员在你的：")
                
                HStack {
                    Button {
                        state.sideOfHelper = .left
                        print("Left of People")
                    } label: {
                        ButtonRectangle(isChoosed: state.sideOfHelper == .left ? true : false, side: .left, "左侧")
                    }
                    .padding(.trailing)
                    .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: (
                        state.sideOfHelper == .left ? true : false)
                    ))
                    .accessibilityHint((state.sideOfHelper == .left ? true : false) ? "当前设置陪跑员为左侧" : "当前设置陪跑员为右侧")
                    
                    Spacer()
                    
                    Button {
                        state.sideOfHelper = .right
                        print("Right of People")
                    } label: {
                        ButtonRectangle(isChoosed: !(state.sideOfHelper == .left ? true : false), side: .right, "右侧")
                    }
                    .padding(.leading)
                    .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: !(state.sideOfHelper == .left ? true : false)))
                    .accessibilityHint((state.sideOfHelper == .left ? true : false) ? "当前设置陪跑员为左侧" : "当前设置陪跑员为右侧")
                }
                .frame(maxHeight: 120)
                
                Text("出发脚设定：")
                
                HStack {
                    Button {
                        state.sideOfYourFirstFoot = .left
                        print("Left of Foot")
                    } label: {
                        ButtonRectangle(isChoosed: (state.sideOfYourFirstFoot == .left ? true : false), side: .left, "左脚")
                    }
                    .padding(.trailing)
                    .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: (state.sideOfYourFirstFoot == .left ? true : false)))
                    .accessibilityHint((state.sideOfYourFirstFoot == .left ? true : false) ? "当前设置出发脚为左脚" : "当前设置出发脚为右脚")
                    
                    Spacer()
                    
                    Button {
                        footSide = false
                        state.sideOfYourFirstFoot = .right
                        print("Right of Foot")
                    } label: {
                        ButtonRectangle(isChoosed: !(state.sideOfYourFirstFoot == .left ? true : false), side: .right, "右脚")
                    }
                    .padding(.leading)
                    .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: !(state.sideOfYourFirstFoot == .left ? true : false)))
                    .accessibilityHint((state.sideOfYourFirstFoot == .left ? true : false) ? "当前设置出发脚为左脚" : "当前设置出发脚为右脚")
                }
                .frame(maxHeight: 120)
            
            Text("配速设定：")
            HStack {
                Button {
                    state.runningSpeed -= 20
                } label: {
                    VStack {
                        LeftButton()
                            .foregroundColor(.primary)
                    }
                }
                
                Spacer()
                
                VStack {
                    Slider(value: $state.runningSpeed, in: 0 ... 600)
                    Text("\(runData.getTime(second: Int(state.runningSpeed)))")
                        .font(.caption)
                        .accessibilityHidden(true)
                }
                .offset(y: -5)
                .frame(maxWidth: 225)
                .accessibilityElement(children: .combine)
                .accessibilityHint("当前配速\(runData.getAccessibilityTime(second: Int(state.runningSpeed)))每公里")
                
                Spacer()
                Button {
                    state.runningSpeed += 20
                } label: {
                    VStack {
                        RightButton()
                            .foregroundColor(.primary)
                    }
                }
            }
            HStack {
                Button {
                    state.vibrationNavigation.toggle()
                } label: {
                    ZStack {
                        VibrationSpecialButton(vibrationSpecial: state.vibrationNavigation)
                        Text("震动辅助导航").font(.custom("PingFang SC Semibold", size: 14)).tracking(-0.41)
                            .foregroundColor(state.vibrationNavigation ? .black : .white)
                            .accessibilityAddTraits(
                                self.accessibilitySelectedPrompt(
                                    judgeBy: state.vibrationNavigation == true ? true : false
                                )
                            )
                    }
                }
                Spacer()
                Button {
                    state.specialAudio.toggle()
                } label: {
                    ZStack {
                        VibrationSpecialButton(vibrationSpecial: state.specialAudio)
                        Text("空间音频辅助导航").font(.custom("PingFang SC Semibold", size: 14)).tracking(-0.41)
                            .foregroundColor(state.specialAudio ? .black : .white)
                            .accessibilityAddTraits(self.accessibilitySelectedPrompt(
                                judgeBy: state.specialAudio == true ? true : false
                            ))
                    }
                }
            }
            .frame(maxHeight: 60)
            .padding(.vertical)
            
            
            Button {
                state.isInRunningView = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                        .frame(maxWidth: .infinity, maxHeight: 80)
                    Text("开始跑步")
                        .font(.custom("PingFang SC Semibold", size: 36)).tracking(-0.41)
                        .foregroundColor(.primary)
                }
            }
            .padding(.bottom)
        }
        .padding(.horizontal, 30)
    }
    func accessibilitySelectedPrompt(judgeBy: Bool) -> AccessibilityTraits {
        return (judgeBy ? [.isSelected, .isButton] : .isButton)
    }
}

struct Start_Previews: PreviewProvider {
    static let state = StateOfSomething()
    static var previews: some View {
//        StartView()
//            .previewDevice(PreviewDeviceModel.shared.iPadPro)
//            .previewInterfaceOrientation(.landscapeLeft)
//            .environmentObject(StateOfSomething())
//            .environmentObject(MainPageViewMode())
        
        ForEach(["iPhone SE (3rd generation)", "iPhone 13 mini", "iPhone 13", "iPhone 13 Pro Max"], id: \.self) { model in
            
            ContentView()
                .environmentObject(state)
                .environmentObject(MainPageViewMode())
                .environmentObject(RunningDataViewModel())
                .previewDevice(PreviewDevice(rawValue: model))
                .onAppear {
                    state.selectedIndex = 0
                }
        }
    }
}


