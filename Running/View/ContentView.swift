//
//  ContentView.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//  SwiftUI How to create Custom Tab View with Tab Bar
//  https://www.youtube.com/watch?v=9lVLFlyaiq4

import SwiftUI

class StateOfSomething: ObservableObject {
    @Published var isInRunningView = false
    @Published var buttonState = "Pause"
    @Published var selectedIndex = 0
}

struct ContentView: View {
    
    @StateObject var state = StateOfSomething()
    @EnvironmentObject var viewModel: MainPageViewMode
    
    var body: some View {
        VStack {
            if !state.isInRunningView {
                VStack {
                    ZStack {
                        switch state.selectedIndex {
                        case 0:
                            if !state.isInRunningView {
                                StartView()
                            } else {
                                Repeat()
                            }
                        case 1:
                            DataStaticsView()
                        case 2:
                            SettingsView()
                        default:
                            StartView()
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
        .fullScreenCover(isPresented: $viewModel.isUserCurrentlyLoggedOut) {
            EmailLogin {
                self.viewModel.isUserCurrentlyLoggedOut = false
                viewModel.fetchCurrentUser()
            }
        }
    }
}
 
struct ContentView_Previews: PreviewProvider {
    static var state = StateOfSomething()
    static var previews: some View {
        ContentView()
            .environmentObject(state)
            .environmentObject(MainPageViewMode())
            .previewDevice("iPhone 13")
        ContentView()
            .environmentObject(state)
            .environmentObject(MainPageViewMode())
            .previewDevice("iPhone 8")
    }
}
