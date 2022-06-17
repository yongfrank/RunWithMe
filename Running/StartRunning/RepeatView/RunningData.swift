//
//  RunningData.swift
//  Running
//
//  Created by Frank Chu on 5/12/22.
//

import SwiftUI

struct RunningData: View {
    @EnvironmentObject var state: StateOfSomething
    var body: some View {
        NavigationView {
            VStack {
                Image("runningDataEnd")
                    .resizable()
                    .scaledToFill()
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
            }
//            .navigationBarHidden(true)
        }
    }
}

struct RunningData_Previews: PreviewProvider {
    static var previews: some View {
        RunningData()
    }
}
