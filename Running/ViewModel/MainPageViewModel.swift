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
    @Published var isUserCurrentlyLoggedOut = false
    @Published var currentLogInUser: UserInformation?
    @Published var showingAlert = false
    @Published var errorMessage = ""
    @Published var users = [UserInformation]()
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
            self.fetchAllUsers()
            self.fetchCurrentUser()
        }
    }
    
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        
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
        }
    }
        
    private func fetchAllUsers() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        print("DEBUG: FETCHING All USER uid from: \(uid)")
        
        FirebaseManager.shared.firestore.collection("users").getDocuments { documentsSnapshot, error in
            if let error = error {
                print("ERROR FetchAllUers: \(error.localizedDescription)")
            }
            documentsSnapshot?.documents.forEach({ snapshot in
                guard let user = try? snapshot.data(as: UserInformation.self) else {
                    print("ERROR: try? snapshot.data")
                    return
                }
                self.users.append(user)
            })
        }
        print("DEBUG: Fetched all users")
    }
    
    func persistImageToStorage(inputImage: UIImage?, user: UserInformation) {
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
        self.fetchAllUsers()
    }
    
    func handleSignOut() {
        self.isUserCurrentlyLoggedOut = true
        try? FirebaseManager.shared.auth.signOut()
    }
    
    func loginUserWithEmail(email: String, password: String) {
        FirebaseManager.shared.auth.signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("ERROR: loginUserWithEmail \(error.localizedDescription)")
                return
            }
            DispatchQueue.main.async {
                self.fetchCurrentUser()
                self.fetchAllUsers()
            }
            self.isUserCurrentlyLoggedOut = false
        }
    }
}
