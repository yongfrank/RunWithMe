//
//  ContentView.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//  SwiftUI How to create Custom Tab View with Tab Bar
//  https://www.youtube.com/watch?v=9lVLFlyaiq4

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var state: StateOfSomething
    @EnvironmentObject var viewModel: MainPageViewMode
    @State private var showingAlert = false
    
    var body: some View {
        VStack {
            if !state.isInRunningView {
                VStack {
                    ZStack {
                        switch state.selectedIndex {
                        case 0:
                            StartView()
//                            if !state.isInRunningView {
//                                StartView()
//                            } else {
//                                StartCountdown()
//                            }
                        case 1:
                            DataStaticsView()
//                            DataPreview()
                        case 2:
                            SettingsView()
                        default:
                            StartView()
                        }
                    }
                    Spacer()
                    TabBarView()
//                        .padding(.bottom)
                    //                TabBarView(selectedIndex: $state.selectedIndex)
                }
            } else {
                StartCountdown()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        .fullScreenCover(isPresented: $viewModel.isUserCurrentlyLoggedOut) {
            EmailLogin {
                viewModel.fetchCurrentUser()
                self.viewModel.isUserCurrentlyLoggedOut = false
                
//                guard let _ = viewModel.currentLogInUser else {
//                    self.showingAlert = true
//                    viewModel.errorMessage = "未连接到服务器"
//                    return
//                }
            }
            .alert(viewModel.errorMessage, isPresented: $showingAlert) {
                Button("好", role: .cancel) {}
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone SE (3rd generation)","iPhone 13 mini", "iPhone 8", "iPhone 13 Pro Max"], id: \.self) { model in
            ContentView()
                .environmentObject(StateOfSomething())
                .environmentObject(MainPageViewMode())
                .environmentObject(RunningDataViewModel())
                .previewDevice(PreviewDevice(rawValue: model))
        }
    }
}
