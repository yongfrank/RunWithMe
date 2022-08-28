//
//  Data.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI

struct DataStaticsView: View {
    @EnvironmentObject var vm: MainPageViewMode
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: .accountExample)
                        .padding(10)
                    TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: .accountExample)
                        .padding(10)
                    TwoAvaterView(currentUser: vm.currentLogInUser ?? .accountExample, withUser: .accountExample)
                        .padding(10)
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct Data_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone 13", "iPhone 13 mini", "iPhone SE (3rd generation)", "iPhone 13 Pro Max"], id: \.self) { model in
            ContentView()
                .environmentObject(StateOfSomething())
                .environmentObject(MainPageViewMode())
                .previewDevice(PreviewDevice(rawValue: model))
        }
    }
}
