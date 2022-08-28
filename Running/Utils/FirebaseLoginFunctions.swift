//
//  FirebaseLogin.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import Foundation
import UIKit

class FirebaseLoginFunctions {
    
//    
//    static let shared = FirebaseLoginFunctions()
//    
//    private func persistImageToStorage(inputImage: UIImage?) {
//        guard let uid = FirebaseManager.shared.auth.currentUser?.uid else { return }
//        let ref = FirebaseManager.shared.storage.reference(withPath: uid)
//        guard let imageData = inputImage?.jpegData(compressionQuality: 0.5) else { return }
//        ref.putData(imageData, metadata: nil) { metadata, err in
//            if let err = err {
//                self.showingAlert = true
//                self.errorMessage = "图片上传失败"
//                print("ERROR: \(err.localizedDescription)")
//                return
//            }
//            
//            ref.downloadURL { url, err in
//                if let error = err {
//                    self.showingAlert = true
//                    self.errorMessage = "图片上传失败"
//                    print("ERROR: \(error.localizedDescription)")
//                    return
//                }
//                guard let url = url else { return }
//                self.storeUserInformation(imageProfileUrl: url)
//            }
//        }
//    }
}
