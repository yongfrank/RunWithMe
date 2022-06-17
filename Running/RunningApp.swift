//
//  RunningApp.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

@main
struct RunningApp: App {
    @StateObject private var state = StateOfSomething()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
        }
    }
}
