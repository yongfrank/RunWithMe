//
//  RunningApp.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//  iOS 15 Commit

import SwiftUI

@main
struct RunningApp: App {
    @StateObject var state = StateOfSomething()
    @StateObject var viewModel = MainPageViewMode()
    @StateObject var runningDataViewModel = RunningDataViewModel()

    var body: some Scene {
        WindowGroup {
//            LandingView()
            ContentView()
                .environmentObject(state)
                .environmentObject(viewModel)
                .environmentObject(runningDataViewModel)
        }
    }
}
