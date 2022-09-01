//
//  SpacialMapView.swift
//  Running
//
//  Created by Frank Chu on 7/5/22.
//

import AVFoundation
import CoreMotion
import SwiftUI

struct SpacialMapView: View {
    @EnvironmentObject var state: StateOfSomething
    @EnvironmentObject var vm: MotionManager
    var body: some View {
        ZStack {
            SpacialArrowView()
                .rotationEffect(.degrees(-vm.yaw * 180 / .pi))
            VStack {
                HStack {
                    Button {
                        state.buttonState = "Pause"
                    } label: {
                        ZStack {
                            // 地图导航
                            // Rectangle 7
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                                .frame(width: 150, height: 68)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 4, x: 0, y: 4)
                            Text("地图导航").font(.custom("PingFang SC Semibold", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                        }
                    }
                    .padding()

                    Button {
                        state.buttonState = "Spacial"
                    } label: {
                        ZStack {
                            // Rectangle 7
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                                .frame(width: 150, height: 68)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 4, x: 0, y: 4)

                            // 空间导航
                            Text("空间导航").font(.custom("PingFang SC Semibold", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                        }
                    }
                    .padding()
                }
                .padding(.top, 40)

                ZStack {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
                        .frame(width: 180, height: 68)
                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 4, x: 0, y: 4)
//                    Text("正在偏移: \(vm.yaw * 180 / .pi)")
                    Text(vm.yaw * 180 / .pi >= 0 ? String(format: "向左偏移: %.2fº", vm.yaw * 180 / .pi) : String(format: "向右偏移: %.2fº", -vm.yaw * 180 / .pi))
                        .font(.custom("PingFang SC Semibold", size: 20)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                }

                Spacer()

                Button {
                    state.buttonState = "PauseView"
                } label: {
                    Image("slide to pause")
                        .resizable()
                        .frame(width: 390, height: 125)
//                        .scaledToFit()
                        .padding(.bottom, 30)
                }
            }
        }
        .background(Color(hex: "#fbe4ef"))
        .ignoresSafeArea()
    }
}

// struct SpacialMapView_Previews: PreviewProvider {
//    static var previews: some View {
//        SpacialMapView()
//    }
// }
