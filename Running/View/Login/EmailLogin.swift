//
//  EmailLogin.swift
//  Running
//
//  Created by Frank Chu on 8/27/22.
//

import SwiftUI
import AuthenticationServices
import Firebase
import FirebaseFirestoreSwift
import Kingfisher

struct EmailLogin: View {
    let didCompleteLoginProcess: () -> ()
    
    /// Email Logged in TextField
    @State private var emailTesting = false
    
    
    @EnvironmentObject var vm: MainPageViewMode
    
    @State private var email = ""
    @State private var password = ""
    @State private var username = ""
    
    
    @State private var showingAlert = false
    @State private var errorMessage = ""
    @State private var showImage = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        GeometryReader { proxy in
            VStack {
                Spacer().frame(height: proxy.size.height * 0.2)
                
                HStack {
                    ZStack {
                        Text("欢迎使用\nRun With Me")
                            .font(.custom("PingFang SC Semibold", size: 36))
                            .foregroundColor(.white)
                            .tracking(-0.41)
                            .offset(x: -50, y: 0)
                            .frame(minHeight: 110)
                    }
                    if emailTesting {
                        emailTextFields
                    }
                }
                
                // Avater
                VStack {
                    Button {
                        showImage.toggle()
                    } label: {
                        Self.avaterChoice(image: inputImage, user: vm.currentLogInUser)
                    }
                    .accessibilityAddTraits(.isImage)
                    .accessibilityLabel("选择头像")
                    .padding(.top, 47)
                    
                    
                    Spacer().frame(height: proxy.size.height * 0.2)
                    
                    SignInWithAppleManager(username: $username, email: $email) {
                        print("DEBUG: email is", email)
                        if email != "" {
                            if let _ = inputImage {
                                persistImageToStorage()
                            } else {
                                self.storeUserInformation(imageProfileUrl: URL(string: UserInformation.accountExample.profileImageUrl)!)
                            }
                        }
                        
                        vm.currentLogInUser?.email = self.email
                        vm.currentLogInUser?.username = self.username
                        
                        self.didCompleteLoginProcess()
                    }
                    
                    Button {
                        vm.isLocal = true
                        vm.loginUserWithEmail(email: UserInformation.accountExample.email, password: "123123", isLocal: true)
                    } label: {
                        Text("测试账号")
                    }
                    
                }
                
                Spacer().frame(height: proxy.size.height * 0.13)
            }
            .fullScreenCover(isPresented: $showImage, content: {
                ImagePicker(image: $inputImage)
            })
            .alert(errorMessage, isPresented: $showingAlert) {
                Button("OK", role: .cancel) {
                    
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "DF1876"))
            .ignoresSafeArea()
        }
    }
    
//    func loginUserWithEmail(email: String, password: String) {
//        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
//            if let error = error {
//                self.showingAlert = true
//                self.errorMessage = error.localizedDescription
//                return
//            }
//            self.didCompleteLoginProcess()
//        }
//    }
    
    func registerUserWithEmail() {
        if self.inputImage == nil || self.username == "" {
            self.showingAlert = true
            self.errorMessage = "用户名或头像未选择"
            return
        }
        
        self.showingAlert = true
        self.errorMessage = "请稍等"
        
        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.showingAlert = true
                self.errorMessage = error.localizedDescription
                print("ERROR: \(error)")
                return
            }
            print("DEBUG: Successfully created uesr: \(result?.user.uid ?? "Unknown Error")")
            
            self.persistImageToStorage()
        }
    }
    
    func persistImageToStorage() {
        
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = self.inputImage?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                self.showingAlert = true
                self.errorMessage = "图片上传失败"
                print("ERROR: \(err.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, err in
                if let error = err {
                    self.showingAlert = true
                    self.errorMessage = "图片上传失败"
                    print("ERROR: \(error.localizedDescription)")
                    return
                }
                guard let url = url else { return }
                self.storeUserInformation(imageProfileUrl: url)
            }
        }
    }
    
    func storeUserInformation(imageProfileUrl: URL) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        //        let userData: [String : String] = [
        //            UserInfoConstants.uid : uid,
        //            UserInfoConstants.username: self.username,
        //            UserInfoConstants.email: self.email,
        //            UserInfoConstants.profileImageUrl: imageProfileUrl.absoluteString
        //        ]
        let userData = UserInformation(id: nil, uid: uid, email: self.email, username: self.username, profileImageUrl: imageProfileUrl.absoluteString)
        let document = FirebaseManager.shared.firestore
            .collection("users")
            .document(uid)
        
        try? document.setData(from: userData) { error in
            if let error = error {
                print("DEBUG firestore: \(error.localizedDescription)")
                return
            }
            self.showingAlert = true
            self.errorMessage = "注册成功"
            print("DEBUG FINALLY: Register Successfully")
        }
        
        //        document.setData(userData) { error in
        //                if let error = error {
        //                    print("DEBUG firestore: \(error.localizedDescription)")
        //                    return
        //                }
        //                self.showingAlert = true
        //                self.errorMessage = "注册成功"
        //                print("DEBUG FINALLY: Register Successfully")
        //            }
    }
    
    
    static func avaterChoice(image: UIImage?, user: UserInformation?) -> some View {
        VStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .cornerRadius(64)
                    .overlay(
                        DetailedView.overlayBorder()
                    )
            } else {
                if let user = user {
                    KFImage(URL(string: user.profileImageUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 128, height: 128)
                        .cornerRadius(64)
                        .overlay(
                            DetailedView.overlayBorder()
                        )
                } else {
                    Image("loginMan")
                        .resizable()
                        .frame(width: 128, height: 128)
                }
            }
        }
        
    }
    
    func loginButton(name: String) -> some View {
        ZStack {
            // Rectangle 7
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                .frame(width: 282, height: 69)
                .shadow(color: Color(
                    #colorLiteral(
                        red: 0.87,
                        green: 0.09,
                        blue: 0.46,
                        alpha: 0.15000000596046448
                    )
                ), radius: 20, x: 2, y: 8)
            Text(name)
                .font(.custom("PingFang SC Semibold", size: 36))
                .foregroundColor(Color(#colorLiteral(red: 0.87, green: 0.09, blue: 0.46, alpha: 1))).tracking(30.09)
        }
    }
    
    var emailTextFields: some View {
        VStack {
            TextField("用户名", text: $username)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            TextField("邮箱", text: $email)
                .textFieldStyle(.roundedBorder)
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
            SecureField("密码", text: $password)
                .textFieldStyle(.roundedBorder)
            
            Button {
                registerUserWithEmail()
            } label: {
                loginButton(name: "注册")
            }
            .padding(.top)
            
            Button {
                vm.loginUserWithEmail(email: email, password: password)
            } label: {
                loginButton(name: "登陆")
            }
        }
        .frame(width: 300, height: 300)
        .padding()
        .background(.ultraThinMaterial)
        .cornerRadius(30)
    }
}

struct EmailLogin_Previews: PreviewProvider {
    static var previews: some View {
        EmailLogin() {
            
        }
        .environmentObject(MainPageViewMode())
        .previewDevice("iPhone 13 Pro")
        EmailLogin() {
            
        }
        .environmentObject(MainPageViewMode())
        .previewDevice("iPhone 8")
    }
}
