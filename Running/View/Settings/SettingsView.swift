//
//  SettingsView.swift
//  Running
//
//  Created by Frank Chu on 5/4/22.
//

import SwiftUI
import Kingfisher

enum SettingsConstants: String {
    case friendsList = "助跑列表", editInfo = "编辑信息", debugApp = "软件测试", logOutCurrentUser = "退出"
}

struct SettingsView: View {
    @EnvironmentObject var vm: MainPageViewMode
    //    @ObservedObject var viewModel = MainPageViewMode()
    @State private var isEditMode = false
    
    let settingsText = ["权限设置", "隐私和安全"]
    @State private var isShowingFriendsList = false
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ScrollView {
                    HStack(alignment: .center) {
                        
                        profileImage
                        
                        Text(vm.currentLogInUser?.username ?? "")
                            .font(.custom("PingFang SC Regular", size: 25))
                            .padding(.horizontal)
                            .frame(minWidth: 80)
                        
                        Button {
                            self.isEditMode = true
                        } label: {
                            ButtonViewTemplate.buttonView(name: SettingsConstants.editInfo.rawValue)
                                .frame(width: 131, height: 63)
                                .offset(x: 0, y: 3)
                        }
                    }
                    .padding(.horizontal, 25)
                    .padding(.top, 50)
                    .padding(.bottom, 73)
                    
                    if vm.isShowingDebuggingMode {
                        NavigationLink() {
                            DebugPageView()
                        } label: {
                            ButtonViewTemplate.barButtonView(name: SettingsConstants.debugApp.rawValue)
                                .frame(width: 311, height: 67)
                        }
                    }
                    
                    NavigationLink() {
                        FriendsList()
                    } label: {
                        ButtonViewTemplate.barButtonView(name: "助跑列表")
                            .frame(width: 311, height: 67)
                    }
                    
                    ForEach(settingsText, id: \.self) { item in
                        Button {
                            
                        } label: {
                            ButtonViewTemplate.barButtonView(name: item)
                                .frame(width: 311, height: 67)
                        }
                    }
                    
                    
                    Button {
                        vm.handleSignOut()
                        print("DEBUG: Logged out successfuly")
                    } label: {
                        ButtonViewTemplate.barButtonView(name: SettingsConstants.logOutCurrentUser.rawValue)
                            .frame(width: 311, height: 67)
                    }
                    .padding()
                    
                }
                .fullScreenCover(isPresented: $isEditMode) {
                    EditMode()
                }
                .frame(width: geo.size.width)
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
    
    var profileImage: some View {
        Group {
            if let user = vm.currentLogInUser {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 76, height: 76)
                    .cornerRadius(64)
                    .overlay(
                        DetailedView.overlayBorder()
                    )
            } else {
                Image(UserInformation.EXAMPLE.profileImageUrl)
                    .resizable()
                    .frame(width: 76, height: 76)
                    .overlay(
                        DetailedView.overlayBorder()
                    )
            }
        }
    }
}

func editInformation() {
    
}


struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(MainPageViewMode())
        
    }
}
