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
    let uid: String
    var email, username, profileImageUrl: String
    
    static let EXAMPLE: UserInformation = .init(uid: "EXAMPLE", email: "TEST", username: "TEST", profileImageUrl: "loginMan")
    static let accountExample: UserInformation = .init(uid: "vGoeCx1cSpelHXHKaiizl1XmOqH3", email: "yongfrank@gmail.com", username: "yongfrank", profileImageUrl: "https://firebasestorage.googleapis.com/v0/b/run-with-me-ad220.appspot.com/o/loginMan.png?alt=media&token=767feac5-9c06-482c-a96a-28da877c9f27")
    
    static let BLANKIMAGEPICKER: UserInformation = .init(uid: "EXAMPLE", email: "TEST", username: "TEST", profileImageUrl: "loginMan")
    static let LOADINGPLACEHOLDER: UserInformation = .init(uid: "EXAMPLE", email: "TEST", username: "加载中", profileImageUrl: "loginMan")
    
    static let MAINLANDLOGINLOCALACCOUNT: UserInformation = .init(uid: "Local 0", email: "local0@apple.com", username: "陈立", profileImageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2F97%2F89%2F03%2F978903be2c7627984afd37dc41afbdc5.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664584649&t=738c42aa20de882d35b2e19453224dd4")
    static let MAINLANDPLACEHOLDER: [UserInformation] = [
        .init(uid: "Local 0", email: "local0@apple.com", username: "陈立", profileImageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fup.enterdesk.com%2Fedpic%2F97%2F89%2F03%2F978903be2c7627984afd37dc41afbdc5.jpg&refer=http%3A%2F%2Fup.enterdesk.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664584649&t=738c42aa20de882d35b2e19453224dd4"),
        .init(uid: "Local 1", email: "local1@apple.com", username: "王珂", profileImageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201902%2F22%2F20190222215528_ndBZ2.thumb.700_0.jpeg&refer=http%3A%2F%2Fb-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664583081&t=964656fb0ced3e9cb10eb9aee29e4d5a"),
        .init(uid: "Local 2", email: "local2@apple.com", username: "关诗敏", profileImageUrl: "https://img1.baidu.com/it/u=3929300816,2130584605&fm=253&fmt=auto&app=138&f=JPEG?w=200&h=200"),
        .init(uid: "Local 3", email: "local3@apple.com", username: "张亮", profileImageUrl: "https://img1.baidu.com/it/u=1292438497,298971591&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=500"),
        .init(uid: "Local 4", email: "local4@apple.com", username: "林瑞", profileImageUrl: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fc-ssl.duitang.com%2Fuploads%2Fitem%2F201911%2F30%2F20191130201338_cykox.jpg&refer=http%3A%2F%2Fc-ssl.duitang.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1664587034&t=772368dec029824a51438441c2f3a405")
    ]
}
