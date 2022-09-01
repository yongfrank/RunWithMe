//
//  DetailedView.swift
//  Running
//
//  Created by Frank Chu on 8/28/22.
//

import SwiftUI
import Kingfisher

struct TimeDataDetailed: View {
    @EnvironmentObject var vm: RunningDataViewModel
    var body: some View {
        GridItemPausePannelView(dataString: String(vm.getTime(second: vm.data.totalTime)), descriptionString: "总时长")
            .accessibilityLabel("总时长\(vm.getAccessibilityTime(second: vm.data.totalTime))")
    }
}

struct DistaceDetailed: View {
    @EnvironmentObject var vm: RunningDataViewModel
    var body: some View {
        GridItemPausePannelView(dataString: String(vm.getDistance(distance: vm.data.distance)), descriptionString: "公里")
    }
}

struct AveragedSpeed: View {
    @EnvironmentObject var vm: RunningDataViewModel
    var body: some View {
        GridItemPausePannelView(dataString: String(vm.getMinSec(second: vm.data.avgPace)), descriptionString: "平均配速")
    }
}

struct HeartRateDetailed: View {
    @EnvironmentObject var vm: RunningDataViewModel
    var body: some View {
        GridItemPausePannelView(dataString: String(vm.data.heartRate), descriptionString: "心率")
    }
}

class DetailedView {
    
    static let shared = DetailedView()
    
    static func overlayBorder() -> some View {
        RoundedRectangle(cornerRadius: 64)
            .stroke(.black, lineWidth: 0)
    }
    
    func redDoneButton() -> some View {
        //Rectangle 7
        ZStack {
        RoundedRectangle(cornerRadius: 16)
            .fill(Color(#colorLiteral(red: 0.8745098114013672, green: 0.09411764144897461, blue: 0.46122294664382935, alpha: 1)))
            .frame(maxHeight: 80)
            .shadow(color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.15000000596046448)), radius:4, x:0, y:4)
            //完成
            Text("完成")
                .font(.custom("PingFang SC Semibold", size: 36))
                .foregroundColor(Color(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1))).tracking(-0.41)
        }
    }
    
    func displayChoosedProfile(inputImage: UIImage?) -> some View {
        VStack {
            if let image = inputImage {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 128, height: 128)
                    .cornerRadius(64)
                    .overlay(
                        DetailedView.overlayBorder()
                    )
            } else {
                Image(UserInformation.BLANKIMAGEPICKER.profileImageUrl)
            }
        }
    }
    
    static func avaterDisplay(user: UserInformation?, sizeOfProfile: CGFloat) -> some View {
        VStack {
            if let user = user {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .cornerRadius(64)
                    .overlay(
                        Self.overlayBorder()
                    )
                Text(user.username)
                    .font(.custom("PingFang SC Regular", size: 16))
            } else {
                Image(UserInformation.LOADINGPLACEHOLDER.profileImageUrl)
                    .resizable()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .overlay(
                        Self.overlayBorder()
                    )
                Text("加载中")
            }
        }
    }
    static func avaterDisplayWithoutName(user: UserInformation?, sizeOfProfile: CGFloat) -> some View {
        VStack {
            if let user = user {
                KFImage(URL(string: user.profileImageUrl))
                    .resizable()
                    .scaledToFill()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .cornerRadius(64)
                    .overlay(
                        Self.overlayBorder()
                    )
            } else {
                Image(UserInformation.EXAMPLE.profileImageUrl)
                    .resizable()
                    .frame(width: sizeOfProfile, height: sizeOfProfile)
                    .overlay(
                        Self.overlayBorder()
                    )
            }
        }
    }
}

struct DetailedView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailedView.shared.redDoneButton()
            DetailedView.avaterDisplay(user: .accountExample, sizeOfProfile: 76)
        }
    }
}
