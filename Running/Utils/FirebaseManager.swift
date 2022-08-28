//
//  FirebaseManager.swift
//  Running
//
//  Created by Frank Chu on 8/27/22.
//

import Foundation
import Firebase
import FirebaseStorage
import FirebaseFirestoreSwift

class FirebaseManager: NSObject {
    
    let auth: Auth
    let storage: Storage
    let firestore: Firestore
    
    static let shared = FirebaseManager()
    
    override init() {
        FirebaseApp.configure()
        self.auth = Auth.auth()
        self.storage = Storage.storage()
        self.firestore = Firestore.firestore()
    }
}

