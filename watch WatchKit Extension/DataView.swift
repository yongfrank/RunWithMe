//
//  DataView.swift
//  watch WatchKit Extension
//
//  Created by  yuting on 2022/9/1.
//

import SwiftUI
import UIKit
struct DataView: View {
    
    @Binding private var isPresented: Bool
    
    
    init(isPresented: Binding<Bool>) {
        _isPresented = isPresented
        
    }
    
    var body: some View {
        
            
                TabView {
                  
                    //---------------
                    VStack {
                        HStack {
                            VStack {
                                Text("31")
                                    .font(Font.system(size: 42, weight: .semibold, design: .default))
                                    .foregroundColor(Color.white)
                                Text("总时长")
                                    .foregroundColor(Color.white)
                                Text("3`11")
                                    .font(Font.system(size: 42, weight: .semibold, design: .default))
                                    .foregroundColor(Color.white)
                                Text("平均配速")
                                    .foregroundColor(Color.white)
                            }
                            .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
                            
                            Spacer()
                            
                            VStack {
                                Text("5.24")
                                    .font(Font.system(size: 42, weight: .semibold, design: .default))
                                    .foregroundColor(Color.white)
                                Text("公里")
                                    .foregroundColor(Color.white)
                                Text("135")
                                    .font(Font.system(size: 42, weight: .semibold, design: .default))
                                    .foregroundColor(Color.white)
                                Text("心率")
                                    .foregroundColor(Color.white)
                            }
                        }
                    }
                    
                    //---------------
                    ScrollView {
                        VStack {
                            HStack {
                                Image("user")
                                    .resizable()
                                    .frame(width: 50, height: 50, alignment: .center)
                                VStack {
                                    Text("With Jobs")
                                    Text("第21次跑步")
                                }
                            }
                            
                            HStack {
                                Text("步长数据")
                                
                                Text("89%")
                                    .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                                    .font(Font.system(size: 35, weight: .semibold, design: .default))
                            }
                            HStack {
                                Text("垂直振奋")
                                
                                Text("82%")
                                    .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                                    .font(Font.system(size: 35, weight: .semibold, design: .default))
                            }
                            HStack {
                                Text("个人姿势配合")
                                
                                Text("84%")
                                    .foregroundColor(Color.init(red: 243/255, green: 42/255, blue: 119/255))
                                    .font(Font.system(size: 35, weight: .semibold, design: .default))
                            }
                        }
                    }
                    
                    
                }.tabViewStyle(.page)
            }
}

struct DataView_Previews: PreviewProvider {
    @State private static var showData: Bool = true
    static var previews: some View {
        DataView(isPresented: $showData)
    }
}
