//
//  MainPageViewModel.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

class MainPageViewMode: ObservableObject {
    @Published var isUserCurrentlyLoggedOut = false
    @Published var currentUser: UserInformation?
    
    init() {
        DispatchQueue.main.async {
            self.isUserCurrentlyLoggedOut = FirebaseManager.shared.auth.currentUser?.uid == nil
            self.fetchAllUsers()
        }
        fetchCurrentUser()
    }
    
    func handleSignOut() {
        self.isUserCurrentlyLoggedOut = true
        try? FirebaseManager.shared.auth.signOut()
    }
    
    func fetchCurrentUser() {
        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
        print("DEBUG: FETCHING uid: \(uid)")
        FirebaseManager.shared.firestore.collection("users").document(uid).getDocument { document, error in
            if let error = error {
                print("ERROR fetchCurrentUser: \(error.localizedDescription)")
            }
            if let document = document {
                do {
                    self.currentUser = try document.data(as: UserInformation.self)
                } catch {
                    print("ERROR document = document \(error.localizedDescription)")
                }
            }
            print("DEBUG: fetchCurrentUser successfully")
        }
    }
    
    @Published var users = [UserInformation]()
    private func fetchAllUsers() {
        FirebaseManager.shared.firestore.collection("users").getDocuments { documentsSnapshot, error in
            if let error = error {
                print("ERROR FetchAllUers: \(error.localizedDescription)")
            }
            documentsSnapshot?.documents.forEach({ snapshot in
                
                guard let user = try? snapshot.data(as: UserInformation.self) else { return }
                self.users.append(user)
            })
        }
    }
}
