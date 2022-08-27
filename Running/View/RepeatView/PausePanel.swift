//
//  PausePanel.swift
//  Running
//
//  Created by Frank Chu on 7/5/22.
//

import SwiftUI
struct RunningDataModel {
    var totalTime: Int = 800
    var avgPace: Int = 360
    var distance: Int = 134
    var heartRate: Int = 5240
}

class RunningData: ObservableObject {
    @Published var data: RunningDataModel

    init() {
        self.data = RunningDataModel()
    }

    func getTime(second: Int) -> String {
        var min = 0, sec = 0
        sec = second % 60

        if second > 60 {
            min = second / 60
        }
        return "\(min):\(sec)"
    }

    func getDistance(distance: Int) -> String {
        let dis = Double(distance) / 1000.0
        return String(format: "%.2f", dis)
    }
}

struct PausePanel: View {
    @StateObject var vm = RunningData()
    @EnvironmentObject var state: StateOfSomething
    var body: some View {
        ZStack {
            // Rectangle 8
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width: 334, height: 335)
                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 4, x: 0, y: 4)
            Button {
                state.buttonState = "Spacial"
            } label: {
                VStack {
                    // 空间音频导航已开启
                    Text("空间音频导航已开启").font(.custom("PingFang SC Semibold", size: 14)).foregroundColor(Color(#colorLiteral(red: 0.9, green: 0.27, blue: 0.57, alpha: 1))).tracking(-0.41).multilineTextAlignment(.center)
                    // 双即可关闭
                    Text("双即可关闭").font(.custom("PingFang SC Regular", size: 10)).foregroundColor(Color(#colorLiteral(red: 0.45, green: 0.45, blue: 0.45, alpha: 1))).tracking(-0.41).multilineTextAlignment(.center)
                }
            }
            .offset(y: 140)
            // Rectangle 7
            ZStack {
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 0.800000011920929)))
                    .frame(width: 334, height: 282)
                    .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 4, x: 0, y: 4)

                VStack {
                    HStack {
                        Spacer()
                        VStack {
                            // 跑步结束
                            Button {
                                
                                //结束发送通知到地图页面，
                                NotificationCenter.default.post(name: NSNotification.Name("STOPRUN"), object: nil)
                                
                                state.buttonState = "End"
                            } label: {
                                VStack {
                                    // Ellipse 510
                                    Circle()
                                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .frame(width: 33, height: 33)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 4, x: 0, y: 4)
                                    Text("跑步结束")
                                        .font(.custom("PingFang SC Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41).multilineTextAlignment(.center)
                                }
                            }

                            VStack {
                                // 31
                                Text(String(vm.getTime(second: vm.data.totalTime)))
                                    .font(.custom("PingFang SC Semibold", size: 32)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                                    .padding(.top)

                                // 总时长
                                Text("总时长").font(.custom("PingFang SC Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                                // 3’11
                                Text("3’11").font(.custom("PingFang SC Semibold", size: 32)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                                    .padding(.top)
                                // 平均配速
                                Text("平均配速").font(.custom("PingFang SC Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                            }
                        }
                        Spacer()
                        VStack {
                            Button {
                                
                                //继续发送通知到地图页面，
                                NotificationCenter.default.post(name: NSNotification.Name("STARTRUN"), object: nil)
                                
                                // Pause means show slide to pause
                                state.buttonState = "Pause"
                            } label: {
                                VStack {
                                    polygon()
                                        .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                        .frame(width: 35, height: 40)
                                        .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.25)), radius: 4, x: 0, y: 4)
                                        .offset(y: 4)
                                    // 跑步继续
                                    Text("跑步继续")
                                        .font(.custom("PingFang SC Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41).multilineTextAlignment(.center)
                                        .offset(y: -6.5)
                                }
                            }

                            VStack {
                                // 31
                                Text(String(vm.getDistance(distance: vm.data.distance)))
                                    .font(.custom("PingFang SC Semibold", size: 32)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                                    .padding(.top, 9)
                                // 总时长
                                Text("公里").font(.custom("PingFang SC Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)

                                // 135
                                Text("135").font(.custom("PingFang SC Semibold", size: 32)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                                    .padding(.top)
                                // 心率
                                Text("心率").font(.custom("PingFang SC Regular", size: 14)).foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
                            }
                        }
                        Spacer()
                    }
                }
            }
            .offset(y: -27)
        }
    }
}

private struct polygon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        path.move(to: CGPoint(x: 0.88889*width, y: 0.40244*height))
        path.addLine(to: CGPoint(x: 0.11806*width, y: 0.79321*height))
        path.addLine(to: CGPoint(x: 0.11806*width, y: 0.01167*height))
        path.addLine(to: CGPoint(x: 0.88889*width, y: 0.40244*height))
        path.closeSubpath()
        return path
    }
}

struct PausePanel_Previews: PreviewProvider {
    static var previews: some View {
        PausePanel()
            .frame(width: 500, height: 500)
            .background(.yellow)
    }
}
