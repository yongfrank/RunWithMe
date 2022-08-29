//
//  UserInfo.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import Foundation
import FirebaseFirestoreSwift

enum UserInfoConstants {
    static var uid = "uid", username = "username", email = "email", profileImageUrl = "profileImageUrl"
}

struct UserInformation: Codable, Identifiable, Hashable {
    @DocumentID var id: String?
    let uid, email: String
    var username, profileImageUrl: String
    
    static let EXAMPLE: UserInformation = .init(uid: "EXAMPLE", email: "TEST", username: "TEST", profileImageUrl: "loginMan")
    static let accountExample: UserInformation = .init(uid: "vGoeCx1cSpelHXHKaiizl1XmOqH3", email: "yongfrank@gmail.com", username: "yongfrank", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/run-with-me-ad220.appspot.com/o/loginMan.png?alt=media&token=767feac5-9c06-482c-a96a-28da877c9f27")
}