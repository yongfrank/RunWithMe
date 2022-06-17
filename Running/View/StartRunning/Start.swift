//
//  Start.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct Start: View {
    
    @State var peopleSide = true
    @State var footSide = true
    @State var speed = 300.0
    @State var vibrationNavigation = true
    @State var specialAudio = true
    @EnvironmentObject var state: StateOfSomething
    
    var body: some View {
//        NavigationView {
            VStack {
                Image("peopleChoose")
                    .resizable()
                    .frame(width: 241.85, height: 96, alignment: .center)
                    .padding(.top)
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
                                }
                                .foregroundColor(.primary)
                            }
                        }
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
                                }
                                .foregroundColor(.primary)
                            }
                        }
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
                                }
                                .foregroundColor(.primary)
                            }
                        }
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
                                }
                                .foregroundColor(.primary)
                            }
                        }
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
                        VStack {
                            Slider(value: $speed, in: 0...600)
//                                .padding(.bottom, 20)
                            Text("\(Int(speed)) s")
                                .font(.caption)
                        }
                        .offset(y: -5)
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
                            .frame(width: 328, height: 80)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:20, x:2, y:8)
                            Text("开始跑步").font(.custom("PingFang SC Semibold", size: 36)).tracking(-0.41)
                                .foregroundColor(.primary)
                        }
                    }
                }
                .padding(.horizontal ,30)
                
                
            }
//            .navigationTitle("HI")
//        }
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
    }
}
