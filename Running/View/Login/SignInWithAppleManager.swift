//
//  SignInWithAppleManager.swift
//  Running
//
//  Created by Frank Chu on 8/27/22.
//

import Foundation
import SwiftUI
import CryptoKit
import AuthenticationServices
import FirebaseAuth

struct SignInWithAppleManager: View {
    @Binding var username: String
    @Binding var email: String
    
    let didFinishedSignInWithApple: () -> ()

    
    private func randomNonceString(length: Int = 32) -> String {
        precondition(length > 0)
        let charset: [Character] =
        Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
        var result = ""
        var remainingLength = length
        
        while remainingLength > 0 {
            let randoms: [UInt8] = (0 ..< 16).map { _ in
                var random: UInt8 = 0
                let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                if errorCode != errSecSuccess {
                    fatalError(
                        "Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)"
                    )
                }
                return random
            }
            
            randoms.forEach { random in
                if remainingLength == 0 {
                    return
                }
                
                if random < charset.count {
                    result.append(charset[Int(random)])
                    remainingLength -= 1
                }
            }
        }
        
        return result
    }
    
    @available(iOS 13, *)
    private func sha256(_ input: String) -> String {
        let inputData = Data(input.utf8)
        let hashedData = SHA256.hash(data: inputData)
        let hashString = hashedData.compactMap {
            String(format: "%02x", $0)
        }.joined()
        
        return hashString
    }
    
    
    @State var currentNonce: String?
    
    var body: some View {
        SignInWithAppleButton(
            onRequest: { request in
                let nonce = randomNonceString()
                self.currentNonce = nonce
                request.requestedScopes = [.fullName, .email]
                request.nonce = sha256(nonce)
            },
            onCompletion: { result in
                switch result {
                case .success(let authResults):
                    switch authResults.credential {
                    case let appleIDCredential as ASAuthorizationAppleIDCredential:
                        guard let nonce = currentNonce else {
                            fatalError("ERROR SIWAButton: Invalid state: A login call back was received, but no login request was sent.")
                        }
                        
                        guard let appleIDToken = appleIDCredential.identityToken else {
                            fatalError("ERROR appleIDToken: Invalid state: A login call back was received, but no login request was sent.")
                        }
                        guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                            print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                            return
                        }
                        
                        let credential = OAuthProvider.credential(withProviderID: "apple.com", idToken: idTokenString, rawNonce: nonce)
                        FirebaseManager.shared.auth.signIn(with: credential) { authResults, error in
                            if (error != nil) {
                                print("ERROR auth.signIn apple: \(error?.localizedDescription as Any)")
                                return
                            }
                            print("DEBUG SignInWithApple Success, uid: \(FirebaseManager.shared.auth.currentUser?.uid ?? "Unknown Apple UID")")
                            self.didFinishedSignInWithApple()
                        }
                        if let username = appleIDCredential.fullName {
                            self.username = String(username.familyName ?? "" + (username.givenName ?? "Apple") )
                        } else {
                            self.username = "Apple"
                        }
                        if let email = appleIDCredential.email {
                            self.email = email
                        } else {
                            self.email = ""
                        }
                    default:
                        break
                    }
                    
                default:
                    break
                }
            }
        )
        .frame(width: 300, height: 50)
        .cornerRadius(10)

    }
}

struct SIWAButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInWithAppleManager(username: .constant("TEST"), email: .constant("TEST")) {
            
        }
    }
}

