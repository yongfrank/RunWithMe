////
////  EmailLoginFieldsView.swift
////  Running
////
////  Created by Frank Chu on 8/29/22.
////
//
//import SwiftUI
//
//struct EmailLoginFieldsView: View {
//    @State private var username = ""
//    @State private var email = ""
//    @State private var password = ""
//    @State private var showImage = false
//    @State private var inputImage: UIImage?
//    
//    var body: some View {
//        VStack {
//            Button {
//                showImage.toggle()
//            } label: {
//                DetailedView.shared.displayChoosedProfile(inputImage: inputImage)
//            }
//            .accessibilityAddTraits(.isImage)
//            .accessibilityLabel("选择头像")
//            .padding(.top, 47)
//            
//            TextField("用户名", text: $username)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.never)
//                .disableAutocorrection(true)
//            TextField("邮箱", text: $email)
//                .textFieldStyle(.roundedBorder)
//                .textInputAutocapitalization(.never)
//                .disableAutocorrection(true)
//            SecureField("密码", text: $password)
//                .textFieldStyle(.roundedBorder)
//            
//            Button {
////                registerUserWithEmail()
//            } label: {
////                loginButton(name: "注册")
//            }
//            .padding(.top)
//            
//            Button {
////                loginUserWithEmail(email: email, password: password)
//            } label: {
////                loginButton(name: "登陆")
//            }
//        }
//        .frame(width: 300, height: 300)
//        .padding()
//        .background(.ultraThinMaterial)
//        .cornerRadius(30)
//        .fullScreenCover(isPresented: $showImage) {
//            ImagePicker(image: $inputImage)
//        }
//    }
//}
//
//struct EmailLoginFieldsView_Previews: PreviewProvider {
//    static var previews: some View {
//        EmailLoginFieldsView()
//    }
//}
