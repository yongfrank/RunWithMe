//
//  MainPageViewModel.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import SwiftUI

class MainPageViewMode: ObservableObject {
    @Published var isShowingDebuggingMode = false
    
    @Published var isUserCurrentlyLoggedOut = false
    @Published var currentLogInUser: UserInformation?
    @Published var currentChoosedHelper: UserInformation?
    @Published var showingAlert = false
    @Published var errorMessage = ""
    @Published var users = [UserInformation]()
    
    @Published var isLocal = false
    
    
    init() {
        DispatchQueue.main.async {
//            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
            self.isUserCurrentlyLoggedOut = self.getUIDFromFirebaseOrLocal() == nil
            self.fetchCurrentUser()
        }
    }
    
    enum MainVMError: Error {
        case getHelperOrLoginUserError
    }
    
    func filteredNoHelplerAndNoSelf() -> [UserInformation] {
        return self.users.filter { $0.uid != self.currentLogInUser?.uid && $0.uid != self.currentChoosedHelper?.uid }
    }
    
    func choosedWithHelper(with helper: UserInformation?) {
        guard let helper = helper else {
            return
        }

        self.currentChoosedHelper = helper
    }
    
    func fetchCurrentUser() {
        guard let uid = self.getUIDFromFirebaseOrLocal() else { return }
        
        if isLocal {
            self.fetchAllUsers()
        } else {
            FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { document, error in
                if let error = error {
                    print("ERROR fetchCurrentUser: \(error.localizedDescription)")
                    return
                }
                if let document = document {
                    do {
                        self.currentLogInUser = try document.data(as: UserInformation.self)
                    } catch {
                        print("ERROR document = document \(error.localizedDescription)")
                    }
                }
                guard let user = self.currentLogInUser else { return }
                print("DEBUG: fetchCurrentUser successfully, email: \(user.email) uid: \(user.uid)")
                self.fetchAllUsers()
            }
        }
    }
    
    func getUIDFromFirebaseOrLocal() -> String? {
        if self.isLocal {
            return UserInformation.MAINLANDLOGINLOCALACCOUNT.uid
        } else {
            guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return nil }
            return uid
        }
    }
        
    func fetchAllUsers() {
        
        guard let uid = getUIDFromFirebaseOrLocal() else { return }
        self.users = []
        print("DEBUG: FETCHING All USER uid from: \(uid)")
        
        if self.isLocal {
            self.users = UserInformation.MAINLANDPLACEHOLDER
            self.isLoggedAndReturnFirstHelper()
        } else {
            FirebaseManager.shared.firestore.collection("users").getDocuments { documentsSnapshot, error in
                if let error = error {
                    print("ERROR FetchAllUers: \(error.localizedDescription)")
                }
                documentsSnapshot?.documents.forEach({ snapshot in
                    guard let user = try? snapshot.data(as: UserInformation.self) else {
                        print("ERROR: try? snapshot.data, users has been replaced with local users Information")
                        return
                    }
                    self.users.append(user)
                })
                
                // Return First User As Helper
                self.isLoggedAndReturnFirstHelper()
            }
            print("DEBUG: Fetched all users")
        }
    }
    
    func isLoggedAndReturnFirstHelper() {
        guard let currentLogInUser = self.currentLogInUser else {
            print("ERROR: fetchedAllusers guard let currentLogInUser = self.currentLogInUser else {")
            return
        }
        self.returnFirstHelperUser(users: self.users, currentUser: currentLogInUser)
    }
    
    func returnFirstHelperUser(users: [UserInformation], currentUser: UserInformation) {
        let firstUser = users.filter{ $0.uid != currentUser.uid }.first
        self.currentChoosedHelper = firstUser
    }
    
    func persistImageToStorageOnEditMode(inputImage: UIImage?, user: UserInformation) {
        var userChanged = user
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
        guard let imageData = inputImage?.jpegData(compressionQuality: 0.5) else { return }
        ref.putData(imageData, metadata: nil) { metadata, err in
            if let err = err {
                print("ERROR: \(err.localizedDescription)")
                return
            }
            
            ref.downloadURL { url, err in
                if let error = err {
                    print("ERROR: \(error.localizedDescription)")
                    return
                }
                guard let url = url else { return }
                userChanged.profileImageUrl = url.absoluteString
                self.storeUserInformation(user: userChanged)
            }
        }
    }
    
    func storeUserInformation(user: UserInformation) {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        let userData = user
        let document = FirebaseManager.shared.firestore
            .collection("users")
            .document(uid)
        
        try? document.setData(from: userData) { error in
            if let error = error {
                print("DEBUG firestore: \(error.localizedDescription)")
                return
            }
        }
        self.fetchCurrentUser()
    }
    
    func handleSignOut() {
        self.isLocal = false
        self.isUserCurrentlyLoggedOut = true
        try? FirebaseManager.shared.auth.signOut()
    }
    
    func loginUserWithEmail(email: String, password: String, isLocal: Bool = false) {
        if !isLocal {
            FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
                if let error = error {
                    print("ERROR: loginUserWithEmail \(error.localizedDescription)")
                    return
                }
                DispatchQueue.main.async {
                    self.fetchCurrentUser()
                }
                self.isUserCurrentlyLoggedOut = false
            }
        } else {
            self.currentLogInUser = UserInformation.MAINLANDLOGINLOCALACCOUNT
            self.fetchAllUsers()
            self.isUserCurrentlyLoggedOut = false
        }
    }
    
    func registerUserWithEmail(inputImage: UIImage?, username: String, email: String, password: String) {
//        if self.inputImage == nil || self.username == "" {
//            self.showingAlert = true
//            self.errorMessage = "用户名或头像未选择"
//            return
//        }
        
//        self.showingAlert = true
//        self.errorMessage = "请稍等"
//
//        FirebaseManager.shared.auth.createUser(withEmail: email, password: password) { result, error in
//            if let error = error {
////                self.showingAlert = true
////                self.errorMessage = error.localizedDescription
//                print("ERROR: \(error)")
//                return
//            }
//            print("DEBUG: Successfully created uesr: \(result?.user.uid ?? "Unknown Error")")
//
//            self.persistImageToStorage()
//        }
    }
}
