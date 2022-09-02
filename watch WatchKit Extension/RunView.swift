//
//  RunView.swift
//  watch WatchKit Extension
//
//  Created by  Jenk on 2022/9/1.
//

import SwiftUI
import UIKit
struct RunView: View {
    
    
    
    @State private var directionIsLeft = true
    @State private var footIsLeft = true
    @State private var vibration: Bool = false
    @State private var space: Bool = false;
    @State private var showStart: Bool = false
    
 
    
    var body: some View {
        
        GeometryReader { geometryProxy in
            
            ScrollView {
                VStack {
                    
                    Text("陪跑员在你的：")
                        .frame(width: geometryProxy.size.width, height: 40,alignment: .center)
                    
                    HStack {
                        Text("左侧")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .background(directionIsLeft ? Color.init(red: 243/255, green: 42/255, blue: 119/255) : Color.init(red: 72/255, green: 74/255, blue: 75/255))
                            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                            .onTapGesture {
                                directionIsLeft = true
                            }
                        
                        
                        
                        Text("右侧")
                            .font(Font.system(size: 20))
                            .foregroundColor(Color.white)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .background(directionIsLeft ? Color.init(red: 72/255, green: 74/255, blue: 75/255) : Color.init(red: 243/255, green: 42/255, blue: 119/255))
                            .cornerRadius(20, corners: [.topRight, .bottomRight])
                            .onTapGesture {
                                directionIsLeft = false
                            }
                        
                    }
                    Text("出发脚为：")
                        .frame(width: geometryProxy.size.width, height: 40,alignment: .center)
                    
                    HStack {
                        Text("左脚")
                            .font(Font.system(size: 20))
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .background(footIsLeft ? Color.init(red: 243/255, green: 42/255, blue: 119/255) : Color.init(red: 72/255, green: 74/255, blue: 75/255))
                            .cornerRadius(20, corners: [.topLeft, .bottomLeft])
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                footIsLeft = true
                            }
                        
                        
                        
                        Text("右脚")
                            .font(Font.system(size: 20))
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .background(footIsLeft ? Color.init(red: 72/255, green: 74/255, blue: 75/255) : Color.init(red: 243/255, green: 42/255, blue: 119/255))
                            .cornerRadius(20, corners: [.topRight, .bottomRight])
                            .foregroundColor(Color.white)
                            .onTapGesture {
                                footIsLeft = false
                            }
                        
                    }
                    
                    
                    
                    Toggle("震动辅助",isOn: $vibration)
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color.init(red: 243/255, green: 42/255, blue: 119/255), lineWidth: 2)
                            
                        )
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    
                    
                    Toggle("空间音频辅助",isOn: $space)
                        .padding(EdgeInsets(top: 15, leading: 10, bottom: 15, trailing: 10))
                        .cornerRadius(20)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20, style: .continuous)
                                .stroke(Color.init(red: 243/255, green: 42/255, blue: 119/255), lineWidth: 2)
                            
                        )
                        .padding(EdgeInsets(top: 5, leading: 20, bottom: 5, trailing: 20))
                    
                    Text("开始跑步")
                        .frame(width: geometryProxy.size.width - 40, height: 48, alignment: .center)
                        .background(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                        .cornerRadius(20)
                        .onTapGesture {
                            showStart = true
                        }
                    
                }
            }
        }
        .fullScreenCover(isPresented: $showStart, content: {
            StartView(isPresented: $showStart)
        })
    }
}

struct RunView_Previews: PreviewProvider {

    static var previews: some View {
        RunView()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
