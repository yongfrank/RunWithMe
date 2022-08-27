//
//  DataResultView.swift
//  Running
//
//  Created by  yuting on 2022/8/27.
//

import SwiftUI

struct DataResultView: View {
    @EnvironmentObject var state: StateOfSomething

    @State var time: String = ""

    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Text("本次跑步数据")
                        .font(.system(size: 28, weight: .medium, design: .default))
                        .frame(width: UIScreen.main.bounds.width, alignment: .leading)
                    
                    VStack {
                        HStack {
                            Text("31")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            Text("31")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        }
                        HStack {
                            Text("总时长")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            Text("公里")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        }
                        HStack {
                            Text("3‘11")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            Text("135")
                                .foregroundColor(.white)
                                .font(.system(size: 28, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        }
                        HStack {
                            Text("平均配速")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            Text("心率")
                                .foregroundColor(.white)
                                .font(.system(size: 12, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        }
                    }
                    .frame(width: UIScreen.main.bounds.width - 20, height: 150, alignment: .center)
                    .background(Color.gray)
                    .cornerRadius(10)
                
                    HStack {
                        VStack {
                            Text("步频配合")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            HStack {
                                ZStack {
                                    Circle()
                                        .stroke(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    Circle()
                                        .trim(from: 0, to: 0.79) // 1
                                        .stroke(
                                            Color.blue,
                                            lineWidth: 10
                                        )
                                
                                    Text("79%")
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                            
                                Image("arrows1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 60, alignment: .center)
                            }
                        
                            Text("变速配合")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            HStack {
                                ZStack {
                                    Circle()
                                        .stroke(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    Circle()
                                        .trim(from: 0, to: 0.89) // 1
                                        .stroke(
                                            Color.purple,
                                            lineWidth: 10
                                        )
                                
                                    Text("89%")
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                            
                                Image("arrows1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 60, alignment: .center)
                            }
                        
                            Text("姿势数据")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            HStack {
                                ZStack {
                                    Circle()
                                        .stroke(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    Circle()
                                        .trim(from: 0, to: 0.84) // 1
                                        .stroke(
                                            Color.yellow,
                                            lineWidth: 10
                                        )
                                
                                    Text("84%")
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                            
                                Image("arrows1")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 60, alignment: .center)
                            }
                        }
                    
                        VStack {
                            Text("步长数据")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            HStack {
                                ZStack {
                                    Circle()
                                        .stroke(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    Circle()
                                        .trim(from: 0, to: 0.11) // 1
                                        .stroke(
                                            Color.blue,
                                            lineWidth: 10
                                        )
                                
                                    Text("11%")
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                            
                                Image("arrows2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 60, alignment: .center)
                            }
                        
                            Text("触地时间")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            HStack {
                                ZStack {
                                    Circle()
                                        .stroke(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    Circle()
                                        .trim(from: 0, to: 0.66) // 1
                                        .stroke(
                                            Color.purple,
                                            lineWidth: 10
                                        )
                                
                                    Text("66%")
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                            
                                Image("arrows2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 60, alignment: .center)
                            }
                        
                            Text("垂直频幅")
                                .font(.system(size: 18, weight: .medium, design: .default))
                                .frame(width: UIScreen.main.bounds.width/2 - 30, height: 30, alignment: .center)
                        
                            HStack {
                                ZStack {
                                    Circle()
                                        .stroke(
                                            Color.gray.opacity(0.5),
                                            lineWidth: 10
                                        )
                                    Circle()
                                        .trim(from: 0, to: 0.58) // 1
                                        .stroke(
                                            Color.yellow,
                                            lineWidth: 10
                                        )
                                
                                    Text("58%")
                                }
                                .frame(width: 60, height: 60, alignment: .center)
                            
                                Image("arrows2")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 30, height: 60, alignment: .center)
                            }
                        }
                    }
                
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 150, alignment: .topLeading)
                // .background(.blue)
            
                Button {
                    state.isInRunningView = false
                    state.selectedIndex = 1
                    state.buttonState = "Pause"
                } label: {
                    Image("doneButton")
                        .resizable()
                        .scaledToFill()
                        .padding(.bottom)
                }
                .frame(width: UIScreen.main.bounds.width - 20, height: 48, alignment: .bottom)
            }
//            .navigationBarHidden(true)
        }
    }
}

struct DataResultView_Previews: PreviewProvider {
    static var previews: some View {
        DataResultView()
    }
}

class CircleProgressView: UIView {
    // 灰色静态圆环
    var staticLayer: CAShapeLayer!
    // 进度可变圆环
    var arcLayer: CAShapeLayer!

    // 为了显示更精细，进度范围设置为 0 ~ 1000
    var progress = Int(arc4random_uniform(100))

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func setProgress(_ progress: Int) {
        self.progress = progress
        setNeedsDisplay()
    }

    override func draw(_ rect: CGRect) {
        if staticLayer == nil {
            staticLayer = createLayer(1000, .gray)
        }
        layer.addSublayer(staticLayer)
        if arcLayer != nil {
            arcLayer.removeFromSuperlayer()
        }
        if tag == 0 {
            arcLayer = createLayer(progress, .blue)
        } else if tag == 1 {
            arcLayer = createLayer(progress, .purple)
        } else {
            arcLayer = createLayer(progress, .yellow)
        }
        layer.addSublayer(arcLayer)
    
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: bounds.width, height: bounds.height))
        label.text = String(format: "%d%%", progress)
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20, weight: .medium)
        addSubview(label)
    }

    private func createLayer(_ progress: Int, _ color: UIColor) -> CAShapeLayer {
        let endAngle = -CGFloat.pi/2 + (CGFloat.pi * 2) * CGFloat(progress)/100
        let layer = CAShapeLayer()
        layer.lineWidth = 8
        layer.strokeColor = color.cgColor
        layer.fillColor = UIColor.clear.cgColor
        let radius = bounds.width/2 - layer.lineWidth
        let path = UIBezierPath(arcCenter: CGPoint(x: bounds.width/2, y: bounds.height/2), radius: radius, startAngle: -CGFloat.pi/2, endAngle: endAngle, clockwise: true)
        layer.path = path.cgPath
        return layer
    }
}
