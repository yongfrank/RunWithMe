//
//  Start.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct StartView: View {
    @State var peopleSide = true
    @State var footSide = true
    @State var speed = 300.0
    @State var vibrationNavigation = true
    @State var specialAudio = true
    @EnvironmentObject var state: StateOfSomething
    @EnvironmentObject var vm: MainPageViewMode
    
    var body: some View {
        NavigationView {
            ScrollView {
                HStack {
                    DetailedView.avaterDisplay(user: vm.currentUser)
                        .padding(.bottom)
                    ForEach(0..<3) { num in
                        
                    }
                }
                buttonCollection
                
            }
            
            .navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarHidden(true)
        }
    }
    
    var buttonCollection: some View {
        VStack(alignment: .leading) {
            Text("陪跑员在你的：")
            
            HStack {
                Button {
                    peopleSide = true
                    print("Left of People")
                    print(peopleSide)
                } label: {
                    ZStack {
                        ButtonRectangle(isChoosed: peopleSide)
                        VStack {
                            Text("左侧").font(.custom("PingFang SC Semibold", size: 48)).tracking(-0.41)
                            Text("Left").font(.custom("PingFang SC Regular", size: 14)).tracking(-0.41)
                                .accessibilityHidden(true)
                        }
                        //                                .foregroundColor(.white)
                    }
                }
                .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: peopleSide))
                
                .accessibilityHint(peopleSide ? "当前设置陪跑员为左侧" : "当前设置陪跑员为右侧")
                
                Spacer()
                Button {
                    peopleSide = false
                    print("Right of People")
                    print(peopleSide)
                } label: {
                    ZStack {
                        ButtonRectangle(isChoosed: !peopleSide)
                        VStack {
                            Text("右侧").font(.custom("PingFang SC Semibold", size: 48)).tracking(-0.41)
                            Text("Right").font(.custom("PingFang SC Regular", size: 14)).tracking(-0.41)
                                .accessibilityHidden(true)
                        }
                        //                                .foregroundColor(.white)
                    }
                }
                .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: !peopleSide))
                .accessibilityHint(peopleSide ? "当前设置陪跑员为左侧" : "当前设置陪跑员为右侧")
            }
            
            Text("出发脚设定：")
            
            HStack {
                Button {
                    footSide = true
                    print("Left of Foot")
                    print(peopleSide)
                } label: {
                    ZStack {
                        ButtonRectangle(isChoosed: footSide)
                        VStack {
                            Text("左脚").font(.custom("PingFang SC Semibold", size: 48)).tracking(-0.41)
                            Text("Left").font(.custom("PingFang SC Regular", size: 14)).tracking(-0.41)
                                .accessibilityHidden(true)
                        }
                        .foregroundColor(.primary)
                    }
                }
                .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: footSide))
                .accessibilityHint(footSide ? "当前设置出发脚为左脚" : "当前设置出发脚为右脚")
                Spacer()
                Button {
                    footSide = false
                    print("Right of Foot")
                    print(peopleSide)
                } label: {
                    ZStack {
                        ButtonRectangle(isChoosed: !footSide)
                        VStack {
                            Text("右脚").font(.custom("PingFang SC Semibold", size: 48)).tracking(-0.41)
                            Text("Right").font(.custom("PingFang SC Regular", size: 14)).tracking(-0.41)
                                .accessibilityHidden(true)
                        }
                        .foregroundColor(.primary)
                    }
                }
                .accessibilityAddTraits(self.accessibilitySelectedPrompt(judgeBy: !footSide))
                .accessibilityHint(footSide ? "当前设置出发脚为左脚" : "当前设置出发脚为右脚")
            }
            Text("配速设定：")
            HStack {
                Button {
                    speed -= 20
                } label: {
                    VStack {
                        LeftButton()
                            .foregroundColor(.primary)
                    }
                }
                
                Spacer()
                
                VStack {
                    Slider(value: $speed, in: 0 ... 600)
                    //                                .padding(.bottom, 20)
                    Text("\(Int(speed)) s")
                        .font(.caption)
                        .accessibilityHidden(true)
                }
                .offset(y: -5)
                .frame(width: 225)
                .accessibilityHint("当前配速 \(speed, specifier: "%g") 秒每公里")
                .accessibilityElement(children: .combine)
                
                Spacer()
                Button {
                    speed += 20
                } label: {
                    VStack {
                        RightButton()
                            .foregroundColor(.primary)
                    }
                }
            }
            HStack {
                Button {
                    vibrationNavigation.toggle()
                } label: {
                    ZStack {
                        VibrationSpecialButton(vibrationSpecial: vibrationNavigation)
                        Text("震动辅助导航").font(.custom("PingFang SC Semibold", size: 14)).tracking(-0.41)
                            .foregroundColor(.primary)
                    }
                }
                Spacer()
                Button {
                    specialAudio.toggle()
                } label: {
                    ZStack {
                        VibrationSpecialButton(vibrationSpecial: specialAudio)
                        Text("空间音频辅助导航").font(.custom("PingFang SC Semibold", size: 14)).tracking(-0.41)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding(.vertical)
            
            Button {
                state.isInRunningView = true
            } label: {
                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                        .frame(maxWidth: .infinity, minHeight: 80)
                    Text("开始跑步")
                        .font(.custom("PingFang SC Semibold", size: 36)).tracking(-0.41)
                        .foregroundColor(.primary)
                }
            }
        }
        .padding(.horizontal, 30)
    }
    func accessibilitySelectedPrompt(judgeBy: Bool) -> AccessibilityTraits {
        return (judgeBy ? [.isSelected, .isButton] : .isButton)
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(StateOfSomething())
            .environmentObject(MainPageViewMode())
            .previewDevice("iPhone 13")
        ContentView()
            .environmentObject(StateOfSomething())
            .environmentObject(MainPageViewMode())
            .previewDevice("iPhone 13 mini")
        ContentView()
            .environmentObject(StateOfSomething())
            .environmentObject(MainPageViewMode())
            .previewDevice("iPhone SE (3rd generation)")
        
        ContentView()
            .environmentObject(StateOfSomething())
            .environmentObject(MainPageViewMode())
            .previewDevice("iPhone 13 Pro Max")
    }
}
