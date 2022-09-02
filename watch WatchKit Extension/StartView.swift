//
//  StartView.swift
//  watch WatchKit Extension
//
//  Created by  yuting on 2022/9/1.
//

import SwiftUI
import UIKit
struct StartView: View {
    
    @Binding private var isPresented: Bool
    
    @State private var showRun: Bool = false
    
    @State private var reciprocal = false
    
    @State var isTimerRunning = false
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
       
    @State private var index = 3
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented

    }
    
    var body: some View {
        
        GeometryReader { geometryProxy in
            ZStack {
                if reciprocal == false {
                    Circle()
                        .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                    Text("开始")
                        .foregroundColor(.white)
                        .font(Font.system(size: 48))
                }
                
                
                if reciprocal == true {
                    if index == 3 {
                        Text("3")
                            .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                            .font(Font.system(size: 88))
                            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height, alignment: .center)
                    }
                    if index == 2 {
                        Text("2")
                            .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                            .font(Font.system(size: 88))
                            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height, alignment: .center)
                    }
                    if index == 1 {
                        Text("1")
                            .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                            .font(Font.system(size: 88))
                            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height, alignment: .center)
                    }
                    if index == 0 {
                        Text("0")
                            .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                            .font(Font.system(size: 88))
                            .frame(width: geometryProxy.size.width, height: geometryProxy.size.height, alignment: .center)
                    }
                    
                }
            }
            .onReceive(timer) { _ in
                if self.isTimerRunning {
                    index -= 1
                    
                    if index == 0 {
                        self.timer.upstream.connect().cancel()
                        self.showRun = true
                    }
                }
            }
            .onTapGesture {
                reciprocal = true
                isTimerRunning = true
            }
            .fullScreenCover(isPresented: $showRun, content: {
                ContentView(isPresented: $showRun)
            })
         }
    }
    
}

struct StartView_Previews: PreviewProvider {
    @State private static var showStart: Bool = true
    static var previews: some View {
        StartView(isPresented: $showStart)
    }
}
