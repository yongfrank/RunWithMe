//
//  RunningView.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//


import SwiftUI
import UIKit
import CoreMotion
import AVFoundation

class MotionManager: ObservableObject {
    var motionManger = CMHeadphoneMotionManager()
    @Published var pitch = 0.0
    @Published var roll = 0.0
    @Published var yaw = 0.0

    init() {}

    func startRecording() {
        motionManger.startDeviceMotionUpdates(to: .main) { [weak self] motion, _ in
            guard let self = self, let motion = motion else { return }
            self.pitch = motion.attitude.pitch
            self.roll = motion.attitude.roll
            self.yaw = motion.attitude.yaw
        }
    }

    func stopRecording() {
        motionManger.stopDeviceMotionUpdates()
    }

    deinit {
        motionManger.stopDeviceMotionUpdates()
    }
}

struct RunningView: View {
    @EnvironmentObject var state: StateOfSomething
    @StateObject var motionHandler = MotionManager()
    @State private var timerCount = 5
    let soundHandler = SoundManager()
    var clock = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    var body: some View {
        ZStack {
            
            MapViewController()
            
//            MapView()
            //            Image("runMap")
            //                .resizable()
            //                .scaledToFill()
            VStack {
                if state.buttonState == "Pause" {
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
                }
                Spacer()
                
                if state.buttonState == "Pause" {
                    Button {
                        
                        //暂停发送通知到地图页面，
                        NotificationCenter.default.post(name: NSNotification.Name("PAUSERUN"), object: nil)
                        
                        state.buttonState = "PauseView"
                    } label: {
                        Image("slide to pause")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 30)
                    }
                } else if state.buttonState == "PauseView" {
                    PausePanel()
//                    Button {
//                        state.buttonState = "End"
//                    } label: {
//                        Image("PausePanel")
//                            .resizable()
//                            .scaledToFit()
//                            .padding(.bottom, 30)
//                    }
                    Spacer()
                } else if state.buttonState == "End" {
                    Button {
                        state.buttonState = "Data"
                        motionHandler.stopRecording()
                    } label: {
                        Image("slide to end")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 25)
                    }
                } else if state.buttonState == "Data" {
                    
                    RunningDataResultView()
                    
                } else if state.buttonState == "Spacial" {
                    SpacialMapView()
                        .environmentObject(motionHandler)
                } else if state.buttonState == "DataResult"{
                    DataResultView()
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            motionHandler.startRecording()
        }
        .onReceive(clock) { _ in
            if state.isInRunningView {
                if motionHandler.yaw < -0.2 {
                    if timerCount % 5 == 0 {
                        soundHandler.playSound(utterance: soundHandler.rightUtterance)
                    }
                    if timerCount == 0 {
                        timerCount = 5
                    }
                    timerCount -= 1
                } else if motionHandler.yaw > 0.2 {
                    if timerCount % 5 == 0 {
                        soundHandler.playSound(utterance: soundHandler.leftUtterance)
                    }
                    if timerCount == 0 {
                        timerCount = 5
                    }
                    timerCount -= 1
                } else {
                    timerCount = 5
                }
            }
        }
    }
    
}

struct SoundManager {
    let leftUtterance = AVSpeechUtterance(string: "正在向左偏")
    let rightUtterance = AVSpeechUtterance(string: "正在向右偏")
    func playSound(utterance: AVSpeechUtterance) {
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-cn")
        AVSpeechSynthesizer().speak(utterance)
    }
    
    func playDegree(direction: String, degree: Double) {
        
        let utterance = AVSpeechUtterance(string: "\(direction)....\(degree)度")
        utterance.voice = AVSpeechSynthesisVoice(language: "zh-cn")
        AVSpeechSynthesizer().speak(utterance)
    }
}


struct RunningView_Previews: PreviewProvider {
    static let state = StateOfSomething()
    static var previews: some View {
        RunningView()
            .environmentObject(state)
            .previewDevice("iPhone 13 Pro")
    }
}
