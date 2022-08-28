//
//  MainPage.swift
//  Running
//
//  Created by Frank Chu on 8/27/22.
//

import SwiftUI
import Firebase
import FirebaseFirestoreSwift


//
//class UserAuth: ObservableObject {
//    @Published var isLoggedin: Bool = false
//
//    func handleLogin() {
//        self.isLoggedin = true
//    }
//
//}
//
//struct MainPage: View {
//    
//    @ObservedObject var vm = MainPageViewMode()
//
//    var body: some View {
////        NavigationView{
//            VStack {
////                SettingsView()
//                Button("log out") {
//                    vm.handleSignOut()
//                    print("DEBUG: Logged out successfuly")
//                }
//                
//            }
////        }
////        .navigationViewStyle(StackNavigationViewStyle())
//        .fullScreenCover(isPresented: $vm.isUserCurrentlyLoggedOut) {
//            EmailLogin {
//                self.vm.isUserCurrentlyLoggedOut = false
//            }
//        }
//        .environmentObject(vm)
//    }
//}
//
//struct MainPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MainPage()
//    }
//}
