//
//  StateOfSometing.swift
//  Running
//
//  Created by Frank Chu on 8/29/22.
//

import Foundation
import SwiftUI

class StateOfSomething: ObservableObject {
    @Published var isInRunningView = false
    @Published var buttonState = "Pause"
    @Published var selectedIndex = 0
//    @Published var debuggingMode = false
    
    @Published var sideOfHelper = SideOfLeftRight.left
    @Published var sideOfYourFirstFoot = SideOfLeftRight.right
    @Published var runningSpeed = 423.0
    @Published var vibrationNavigation = false
    @Published var specialAudio = true
}
enum SideOfLeftRight {
    case left, right
}

struct PreviewDeviceModel {
    static let shared = PreviewDeviceModel()
    let iPhoneSE: PreviewDevice = "iPhone SE (3rd generation)"
    let iPhone13: PreviewDevice = "iPhone 13"
    let iPhone13mini: PreviewDevice = "iPhone 13 mini"
    let iPhone13ProMax: PreviewDevice = "iPhone 13 mini"
    let iPadAir: PreviewDevice = "iPad Air (5th generation)"
    let iPadPro: PreviewDevice = "iPad Pro (12.9-inch) (5th generation)"
}

class MapViewModel: ObservableObject {
    @Published var timeString: String = "0分0秒"
}


