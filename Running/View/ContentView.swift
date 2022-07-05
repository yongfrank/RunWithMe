//
//  ContentView.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//  SwiftUI How to create Custom Tab View with Tab Bar
//  https://www.youtube.com/watch?v=9lVLFlyaiq4

import SwiftUI

//@MainActor
class StateOfSomething: ObservableObject {
    @Published var isInRunningView = false
    @Published var buttonState = "Pause"
    @Published var selectedIndex = 0
}

struct ContentView: View {
    
    @StateObject var state = StateOfSomething()
    
    var body: some View {
        VStack {
            if !state.isInRunningView {
                VStack {
                    ZStack {
                        switch state.selectedIndex {
                        case 0:
                            if !state.isInRunningView {
                                Start()
                            } else {
                                Repeat()
                            }
                        case 1:
                            Data()
                        case 2:
                            SettingsView()
                        default:
                            Start()
                        }
                    }
                    Spacer()
                    TabBarView()
    //                TabBarView(selectedIndex: $state.selectedIndex)
                }
            } else {
                Repeat()
                    .environmentObject(state)
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .environmentObject(state)
        
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var state = StateOfSomething()
    static var previews: some View {
        ContentView()
            .environmentObject(state)
            .previewDevice("iPhone 13")
    }
}
