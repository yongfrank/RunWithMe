//
//  DataView.swift
//  Running
//
//  Created by  yuting on 2022/8/27.
//

import SwiftUI

struct DataView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink {
                    DataPreview()
                } label: {
                    HStack {
                        HStack {
                            VStack {
                                Image("user1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("user1")
                            }
                            
                            VStack {
                                Image("user2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("user2")
                            }
                        }.frame(width: 100, height: 100, alignment: .center)
                        
                        HStack {
                            VStack {
                                Image("user1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("user1")
                            }
                            
                            VStack {
                                Image("user2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("user2")
                            }
                        }.frame(width: 100, height: 100, alignment: .center)
                        
                        HStack {
                            VStack {
                                Image("user1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("user1")
                            }
                            
                            VStack {
                                Image("user2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 50, height: 50, alignment: .center)
                                
                                Text("user2")
                            }
                        }.frame(width: 100, height: 100, alignment: .center)
                    }
                }
                
                HStack {
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .trim(from: 0.0, to: CGFloat(0.8))
                                .stroke(Color(.sRGB, red: 254/255, green: 191/255, blue: 156/255, opacity: 1), lineWidth: 3.0)
                                .animation(.linear, value: 1)
                                .background(Color(.sRGB, red: 255/255, green: 94/255, blue: 4/255, opacity: 1))
                                .cornerRadius(5)
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        
                        Text("步长数据")
                        Text("90%")
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .trim(from: 0.0, to: CGFloat(0.8))
                                .stroke(Color(.sRGB, red: 249/255, green: 205/255, blue: 204/255, opacity: 1), lineWidth: 3.0)
                                .animation(.linear, value: 1)
                                .background(Color(.sRGB, red: 245/255, green: 133/255, blue: 135/255, opacity: 1))
                                .cornerRadius(5)
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        
                        Text("姿势数据")
                        Text("65%")
                    }
                    
                    VStack {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .trim(from: 0.0, to: CGFloat(0.8))
                                .stroke(Color(.sRGB, red: 249/255, green: 224/255, blue: 194/255, opacity: 1), lineWidth: 3.0)
                                .animation(.linear, value: 1)
                                .background(Color(.sRGB, red: 237/255, green: 181/255, blue: 104/255, opacity: 1))
                                .cornerRadius(5)
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        
                        Text("触地数据")
                        Text("75%")
                        
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .trim(from: 0.0, to: CGFloat(0.8))
                                .stroke(Color(.sRGB, red: 208/255, green: 185/255, blue: 241/255, opacity: 1), lineWidth: 3.0)
                                .animation(.linear, value: 1)
                                .background(Color(.sRGB, red: 134/255, green: 76/255, blue: 214/255, opacity: 1))
                                .cornerRadius(5)
                        }
                        .frame(width: 100, height: 100, alignment: .center)
                        
                        Text("垂直数据")
                        Text("78%")
                    }
                }
            }
        }
    }
}

struct DataView_Previews: PreviewProvider {
    static var previews: some View {
        DataView()
    }
}
