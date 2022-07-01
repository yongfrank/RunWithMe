//
//  LandingView.swift
//  Running
//
//  Created by Frank Chu on 6/27/22.
//

import SwiftUI

struct UserInfo: Codable {
    var name: String
}

class UserRepo {
    private let USER_KEY = "USER_KEY"
    private var user: UserInfo
    init() {
        if let data = UserDefaults.standard.data(forKey: USER_KEY) {
            if let decoded = try? JSONDecoder().decode(UserInfo.self, from: data) {
                self.user = decoded
                print("Data Retrived in UserDefaults")
                return
            }
        }
        self.user = UserInfo(name: "Frank")
    }

    func load() -> UserInfo {
        return user
    }

    func save(user: UserInfo) {
        if let encoded = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encoded, forKey: USER_KEY)
            print("Data saved at: \(Date().formatted(date: .omitted, time: .standard))")
        }
    }
}

class ViewModel: ObservableObject {
    @Published var user: UserInfo
    private var repository = UserRepo()
    init() {
        self.user = repository.load()
    }

    func saveData() {
        objectWillChange.send()
        repository.save(user: user)
    }
}

struct LandingView: View {
    @StateObject var vm = ViewModel()
    @State private var isActive = false
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    Spacer().frame(height: proxy.size.height * 0.25)

                    // Welcome Word
                    HStack {
                        Spacer().frame(width: proxy.size.width * 0.106)
                        Text("欢迎使用\nRun With Me")
                            .font(.custom("PingFang SC Semibold", size: 36))
                            .foregroundColor(.white)
                            .tracking(-0.41)
                        Spacer()
                    }

                    Spacer()

                    // Avater
                    VStack {
                        // Ellipse 433
                        // Ellipse 433
                        Circle()
                            .fill(RadialGradient(
                                gradient: Gradient(stops: [
                                    .init(color: Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)), location: 0),
                                    .init(color: Color(#colorLiteral(red: 0.7686274647712708, green: 0.7686274647712708, blue: 0.7686274647712708, alpha: 0)), location: 1),
                                ]),
                                center: UnitPoint(x: 0.17968745029793087, y: 0.7968750518411999),
                                startRadius: 2.125459606136431,
                                endRadius: 212.5459606136431
                            ))
                            .frame(width: 109, height: 109)
                        // User Name Here
                        Text(vm.user.name)
                            .font(.custom("PingFang SC Regular", size: 16))
                            .foregroundColor(.white)
                            .tracking(-0.41)
                    }

                    Spacer()

                    // Login Button
                    NavigationLink {
                        ConnectView()
                    } label: {
                        ZStack {
                            // Rectangle 7
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                                .frame(width: 282, height: 69)
                                .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius: 20, x: 2, y: 8)
                            // 登录
                            Text("登录").font(.custom("PingFang SC Semibold", size: 36)).foregroundColor(Color(#colorLiteral(red: 0.7, green: 0.93, blue: 0.2, alpha: 1))).tracking(30.09)
                        }
                    }

                    Spacer().frame(height: proxy.size.height * 0.15)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(hex: "B1EE34"))
            }
            .navigationBarHidden(true)
        }
    }
}

struct LandingView_Previews: PreviewProvider {
    static var previews: some View {
        LandingView().previewDevice("iPhone 13 Pro Max")
        LandingView().previewDevice("iPhone 13 Pro")
        LandingView().previewDevice("iPhone 8")
    }
}

/*
 Introduction: For Enter String Hex
 From: https://stackoverflow.com/a/56874327/18652021
 Usage:
 Text("欢迎使用\nRun With Me")
     .font(.custom("PingFang SC Semibold", size: 36))
     .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
 */
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
