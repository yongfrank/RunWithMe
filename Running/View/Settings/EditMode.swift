//
//  EditMode.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI

struct EditMode: View {
    @EnvironmentObject var vm: MainPageViewMode
    
    @State private var username: String = ""
    @State private var inputImage: UIImage?
    
    @State private var isShowingImage = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ScrollView {
                Button {
                    isShowingImage.toggle()
                } label: {
                    EmailLogin.avaterChoice(image: inputImage, user: vm.currentLogInUser)
                }
                
                TextField("", text: $username)
                    .textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .padding()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("取消") {
                        dismiss()
                    }
                }
                ToolbarItem {
                    Button("完成") {
                        vm.currentLogInUser?.username = self.username
                        guard let user = vm.currentLogInUser else {
                            print("ERROR: user = vm.currentLogInUser")
                            return
                        }
                        if let inputImage = inputImage {
                            vm.persistImageToStorage(inputImage: inputImage, user: user)
                        } else {
                            vm.storeUserInformation(user: user)
                        }
                        dismiss()
                    }
                    .foregroundColor(.blue)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("编辑信息")
        }
        .onAppear {
            username = self.vm.currentLogInUser?.username ?? ""
        }
        .fullScreenCover(isPresented: $isShowingImage, content: {
            ImagePicker(image: $inputImage)
        })
    }
}

struct EditMode_Previews: PreviewProvider {
    static var previews: some View {
        EditMode()
            .environmentObject(MainPageViewMode())
    }
}
