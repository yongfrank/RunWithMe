//
//  RunningView.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct RunningView: View {
    @EnvironmentObject var state: StateOfSomething
    
    var body: some View {
        ZStack {
            Image("runMap")
                .resizable()
                .scaledToFill()
            VStack {
                Spacer()
                
                if state.buttonState == "Pause" {
                    Button {
                        state.buttonState = "PauseView"
                    } label: {
                        Image("slide to pause")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 30)
                    }
                } else if state.buttonState == "PauseView" {
                    Button {
                        state.buttonState = "End"
                    } label: {
                        Image("PausePanel")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 30)
                    }
                    Spacer()
                } else if state.buttonState == "End" {
                    Button {
                        state.buttonState = "Data"
                    } label: {
                        Image("slide to end")
                            .resizable()
                            .scaledToFit()
                            .padding(.bottom, 30)
                    }
                } else if state.buttonState == "Data" {
                    RunningData()
                }
            }
            
        }
    }
}

struct RunningView_Previews: PreviewProvider {
    static let state = StateOfSomething()
    static var previews: some View {
        RunningView()
            .environmentObject(state)
    }
}
