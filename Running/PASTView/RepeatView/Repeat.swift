//
//  Repeat.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct Repeat: View {
    @State var timeRemaining = 4
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var startTimmer = 0
    
    var body: some View {
        VStack {
            
            if startTimmer == 0 {
                VStack {
                    //开始跑步
                    Text("开始跑步").font(.custom("PingFang SC Semibold", size: 36)).foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.09, blue: 0.46, alpha: 1))).tracking(-0.41)
                    //陪跑员Jobs
                    Text("陪跑员").font(.custom("PingFang SC Regular", size: 20)).tracking(-0.41) + Text("Jobs").font(.custom("PingFang SC Medium", size: 20)).tracking(-0.41)
                    //他在你的左侧
                    Text("他在你的").font(.custom("PingFang SC Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8))).tracking(-0.41) + Text("左侧").font(.custom("PingFang SC Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.8))).tracking(-0.41)
                    //你的出发脚为右脚
                    Text("你的出发脚为").font(.custom("PingFang SC Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).tracking(-0.41) + Text("右脚").font(.custom("PingFang SC Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6))).tracking(-0.41)
                    //配速4mins20s
                    Text("配速").font(.custom("PingFang SC Regular", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4))).tracking(-0.41) + Text("4mins20s").font(.custom("PingFang SC Medium", size: 20)).foregroundColor(Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.4))).tracking(-0.41)
                }
            } else if startTimmer == 1 {
                Text("\(timeRemaining)")
                    
                    .font(.custom("PingFang SC Semibold", size: 64)).foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.09, blue: 0.46, alpha: 1)))
            } else if startTimmer == 2 {
                RunningView()
            }
            
        }
        .onReceive(timer) { _ in
            if startTimmer == 0 {
                startTimmer += 1
            }
            if timeRemaining > 0 {
                timeRemaining -= 1
            }
            if timeRemaining == 0 {
               startTimmer = 2
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(RadialGradient(
            gradient: Gradient(stops: [
        .init(color: Color(#colorLiteral(red: 0.9137254953384399, green: 0.027450980618596077, blue: 0.35686275362968445, alpha: 1)), location: 0),
        .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0.8327619433403015)]),
            center: UnitPoint(x: -0.24533326457326066, y: 1.1422413843163595),
            startRadius: 2.3797177117913995,
            endRadius: 944.8551338270172
          ))
        
    }
}

struct Repeat_Previews: PreviewProvider {
    static var previews: some View {
        Repeat()
    }
}
