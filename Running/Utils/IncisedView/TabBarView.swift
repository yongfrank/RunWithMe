//
//  TabBar.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct TabBarView: View {
    let tabText = ["开始跑步", "跑步数据", "设置"]
    let tabImage: [Any] = [RunningManShape.self, DataShape.self, SettingsShape.self]
    @EnvironmentObject var state: StateOfSomething
    //    @Binding var selectedIndex: Int
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                ForEach(0..<tabText.count, id: \.self) { index in
                    Button {
                        state.selectedIndex = index
                    } label: {
                        Group {
                            Spacer()
                            VStack {
                                self.buildView(types: self.tabImage, index: index)
                                    .foregroundColor(Color(hex: state.selectedIndex == index ? 0xDF1878 : 0x535353))
                                Text(tabText[index])
                            }
                            .frame(width: 50, height: 55)
                            .font(.system(size: 12))
                            .foregroundColor(Color(.label))
                            .accessibilityAddTraits(
                                state.selectedIndex == index
                                ? [.isSelected, .isButton]
                                : .isButton
                            )
                            Spacer()
                        }
                    }
                }
            }
        }
    }
    
    func buildView(types: [Any], index: Int) -> AnyView {
        switch types[index].self {
        case is RunningManShape.Type: return AnyView( RunningManShape() )
        case is DataShape.Type: return AnyView( DataShape() )
        case is SettingsShape.Type: return AnyView( SettingsShape() )
        default: return AnyView(RunningManShape())
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static let state = StateOfSomething()

    static var previews: some View {
        TabBarView()
            .environmentObject(StateOfSomething())
            .previewLayout(.fixed(width: 500, height: 150))
        ForEach(["iPhone 13", "iPhone 13 mini", "iPhone SE (3rd generation)", "iPhone 13 Pro Max"], id: \.self) { model in
            ContentView()
                .environmentObject(state)
                .environmentObject(MainPageViewMode())
                .previewDevice(PreviewDevice(rawValue: model))
                .onAppear {
                    state.selectedIndex = 0
                }
        }
    }
}
